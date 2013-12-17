class Element
  attr_accessor :datum, :next_elem

  def initialize(datum, next_elem)
    @datum = datum
    @next_elem = next_elem
  end

  def next
    self.next_elem
  end

  def next=(elem)
    self.next_elem = elem
  end

  def self.to_a(elem)
    temp = []
    current = elem
    while current
      temp << current.datum
      current = current.next
    end
    temp
  end

  def reverse
    # reverses the elements connected via next
    return Element.new(self.next.datum, self) if self.next
    self
  end

  def self.from_a(array)
    return nil if array.empty?
    current = nil
    array.each_with_index do |value, i|
      next_elem = array[i+1] || nil
      begin
        current = Element.new(value, Element.new(next_elem))
      rescue
        binding.pry
      end
    end
    current
  end

end