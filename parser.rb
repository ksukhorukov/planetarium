#!/usr/bin/env ruby

ARGF.each_line do |line|
	data = line.split(' ')
	puts data[2]
end