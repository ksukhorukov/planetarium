#!/usr/bin/env ruby

require 'net/ping/tcp'

ARGF.each_line do |host| 
	host.strip! 
	if Net::Ping::TCP.new(host).ping? 
		print "#{host}\n"
		STDOUT.flush
	end
end

