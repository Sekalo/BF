class Cells
	def initialize(numb = 3000)
		@cell=Array.new(numb, 0)
		@pointer=0	
	end

	def add(n = 1)
		@cell[@pointer] += n
	end

	def sub (n = 1)
		@cell[@pointer] -= n if @cell[@pointer]>0
	end

	def pointer_move(n)
		@pointer += n if @pointer < 3000
	end

	def value
		@cell[@pointer]
	end

	def char
		@cell[@pointer].chr
	end

	def [](n)
		@cell[n]		
	end

	def char=(a)
		@cell[@pointer] = a.ord		
	end

	def pointer
		@pointer
	end

	def to_s
		@cell.to_s
	end
end