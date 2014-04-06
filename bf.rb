#!/usr/bin/env ruby

require "./cells.rb"
require "./parse.rb"

Version = "v0.1"

debug = false

puts "bf - Brainfuck interpreter on Ruby.\nArgument '-h' for help." if ARGV.length == 0

ARGV.each do |arg|
	if arg[0,1] == '-'
		case arg[1,1]
			when 'd'
				debug = true
			when 'v'
				puts Version
			when 'h'
				puts <<HELP
NAME:
	bf - Brainfuck interpreter on Ruby.

USAGE:
	bf.rb [-d/-v/-h] file1 ...

DESCRIPTION:
	A simple interpreter for the esoteric programming language "Brainfuck".

COMMANDS:
	-d - debug	- Enable debug mode. 
	-v - version	- Output version information
	-h - help 	- Output this information

EXAMPLES OF USAGE:
	ruby bf.rb test.b 		- Start interprete file "test.b"
	./bf.rb test.b 			- The same as "ruby bf.rb test.b"
	./bf.rb -d test.b 		- Start interprete file "test.b" and output all steps.
	echo "Hello" | ./bf.rb test.b 	- Start interprete file "test.b" for input line "Hello"

AUTHOR:	
	Sekalo Evgen, Kharkiv, 2014

HELP
				exit
			else
				puts "Uncnown command: '#{arg}' try '-h' for help"
		end
	else
		begin
			begin
				bf_file = File.open(arg){ |file| file.read }
			rescue
				raise "Error on open file '#{arg}'"
			end
			cell=Cells.new()
			begin
				parse(bf_file, cell, debug);
			rescue
				raise "Parse error on file '#{arg}':\n   #{$!}"
			end
		rescue
			puts $!
		end
	end
end

