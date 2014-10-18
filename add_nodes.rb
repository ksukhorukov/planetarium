#!/usr/bin/env ruby

require 'net/ping/tcp'
require './config.rb'

request_header =  %{ 
<methodCall>
	<methodName>AddSliceToNodes</methodName>
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
 }

 request_add_node = %{
       <param>
             <value><string>%{slice_name}</string></value>
       </param>
       <param>
             <array>
             		<data>
             	 		<value><string>%{node_name}</string></value>
             		</data>
             </array>
       </param>
   </params>
</methodCall> 
}

params = PlanetlabConfig::params

ARGF.each_line do |host|
	host.strip!
	if Net::Ping::TCP.new(host).ping? 
		params[:node_name] = host
		request =  (request_header % params) + (request_add_node % params)
		puts request
		puts system("curl -H 'Content-Type: text/xml' -d '#{request}' https://www.planet-lab.eu/PLCAPI/")
	end
end




