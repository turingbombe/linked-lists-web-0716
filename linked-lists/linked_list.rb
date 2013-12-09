require 'forwardable'

class Deque
  attr_accessor :queue

   extend Forwardable
   def_delegators :@queue, :push, :pop, :unshift, :shift

   def initialize
     self.queue = []
   end
end
