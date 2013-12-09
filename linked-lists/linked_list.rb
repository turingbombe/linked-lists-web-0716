class Deque
  attr_accessor :queue

  def initialize
    self.queue = []
  end

  def push(el)
    queue.push(el)
  end

  def pop
    queue.pop
  end

  def unshift(el)
    queue.unshift(el)
  end

  def shift
    queue.shift
  end
end
