#!/usr/bin/env ruby

require './config.rb'

request_get_nodes_ids = %{
<methodCall>
	<methodName>GetSlices</methodName>
	<params>
			<param>
        <struct>
           <member>
             <name>AuthMethod</name>
             <value><string>password</string></value>
          </member>
          <member>
             <name>Username</name>
             <value><string>%{username}</string></value>
          </member>
          <member>
             <name>AuthString</name>
             <value><string>%{password}</string></value>
          </member>
       </struct>
       </param>
       <param>
             <value><string>%{slice_name}</string></value>
       </param>
       <param>
             <array>
             		<data>
             	 		<value><string>node_ids</string></value>
             		</data>
             </array>
       </param>
   </params>
</methodCall>
}

#slice_nodes = plc_api.GetNodes(auth,node_ids,[’hostname’])

request_node_name = %{
<methodCall>
	<methodName>GetNodes</methodName>
	<params>
			<param>
        <struct>
           <member>
             <name>AuthMethod</name>
             <value><string>password</string></value>
          </member>
          <member>
             <name>Username</name>
             <value><string>%{username}</string></value>
          </member>
          <member>
             <name>AuthString</name>
             <value><string>%{password}</string></value>
          </member>
       </struct>
       </param>
       <param>
             <array>
             		<data>
             	 		<value><int>%{node_id}</int></value>
             		</data>
             </array>
       </param>
       <param>
           <array>
              <data>
                <value><string>hostname</string></value>
              </data>
           </array>
       </param>
   </params>
</methodCall>
}

params = PlanetlabConfig::params

#get nodes ids

request = request_get_nodes_ids % params
command = "curl -H 'Content-Type: text/xml' -d '%{request}' https://www.planet-lab.eu/PLCAPI/" % { :request => request } 
response = `#{command}`

nodes_ids = []

response.split("\n").each do |line|
	nodes_ids << $1 if /<value><int>(\d+)<\/int><\/value>/.match(line)
end

p nodes_ids

#get nodes hostnames

hostnames = {}
nodes_ids.each do |node_id|
	params[:node_id] = node_id
	request = request_node_name % params
	command = command = "curl -H 'Content-Type: text/xml' -d '%{request}' https://www.planet-lab.eu/PLCAPI/" % { :request => request } 
  response = `#{command}`
  response.split("\n").each do |line|
  	puts line
  	hostnames[node_id] = $1 if /<value><string>(.+)<\/string><\/value>/.match(line)
  end
 end
  

hostnames.each do |id, remote_host|
  params[:remote_host] = remote_host

  upload_script = "scp %{upload_file} %{slice_name}@%{remote_host}:%{target_file_name}"  % params
  result =  `#{upload_script}`

  execute_script = "ssh %{slice_name}@%{remote_host} \"python ./%{target_file_name}; rm %{target_file_name}\"" % params
  puts execute_script
  result = `#{execute_script}`
end











