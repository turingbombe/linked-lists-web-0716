class Node
	attr_accessor :data, :next

	def initialize(data, next_v = nil)
		@data = data
		@next = next_v
	end
	
end