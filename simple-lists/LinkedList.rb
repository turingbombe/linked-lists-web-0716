require_relative 'Node'

class LinkedList
	attr_accessor :data, :length
	attr_reader :head

	def initialize(data)
		@length = 1
		@head = Node.new(data)
	end

	def push(data)
		node = @head
		while node.next != nil
			node = node.next
		end
		@length += 1
		node.next = Node.new(data)
	end

	def show
		node = @head
		while node.next != nil
			puts node.data
			node = node.next
		end
		puts node.data
	end

	def index_at(index)
		if index < length
			i = 0
			node = @head
			while i < index
				node = node.next
				i += 1
			end
			response = node.data
		else
			response =  nil
		end
		response
	end

	def insert_at_index(index, data)
		if index <= length
			i = 0
			node = @head
			while i < index -1
				node = node.next
				i += 1
			end
			new_next = node.next
			@length += 1
			node.next = Node.new(data,new_next)
		else
			i = 0
			node = @head
			while i < index -1
				if node.next == nil
					node.next = Node.new(nil)
					node = node.next
					@length += 1
				else
					node = node.next
				end
				i += 1
			end
			@length +=1
			node.next = Node.new(data)
		end
	end

	def unshift(data)
		node = @head
		@length += 1
		@head = Node.new(data, node)
	end


end
