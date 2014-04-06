def parse(code, cell, debug_mode = false)
	str = code
	pos = 0
	while pos < str.length do 
		symb = str[pos, 1]
		pos += 1
		case symb
			when "+"
				cell.add
			when "-"
				cell.sub
			when "."
				print " output:" if debug_mode
				print cell.char
			when ","
				character = STDIN.getc
					if character == nil
						print "\n"
						exit
					end
				if character.ord !=10 
					cell.char = character
				else
					print "\n"
				end
			when ">"
				cell.pointer_move(1)
			when "<"
				cell.pointer_move(-1)
			when "["
					num_brecket = 1
					position = pos
					while num_brecket > 0
						case str[position,1]
							when "["
								num_brecket += 1
							when "]"
								num_brecket -= 1
						end
						position += 1 
						raise "Bracket Error ('[' without ']')" if position > str.length
					end
					while cell.value > 0
						parse(str[pos, position-pos - 1 ], cell, debug_mode)
					end
					pos = position 

			when "]"
				raise "Bracket Error (']' without '[')"
		end
		if debug_mode
			print "\n|#{symb}|c:[#{cell.value}]|p^#{cell.pointer}"
			sleep 0.2
		end
	end
end