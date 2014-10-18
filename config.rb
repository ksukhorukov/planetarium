#Edit this file and fill in your own credentials

module PlanetlabConfig
	@@config = 
    {  
     :username => 'your.email@here.com',    
     :password => 'your_password', 
     :slice_name => 'slice_name',
     #optional:
     :target_file_name => '422773_phonehome.py', 
     :upload_file => 'phonehome.py'
		}
	def self.params
		@@config 
	end
end

