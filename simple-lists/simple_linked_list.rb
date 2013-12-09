class Element
  attr_accessor :next, :datum

  def initialize(datum, next_element=nil)
    self.next = next_element
    self.datum = datum
  end

  def to_a
    array = []
    current = self

    while current
      array.push current.datum
      current = current.next
    end

    array
  end

  def self.to_a(element)
    element.to_a
  end

  def self.from_a(list)
    list = list.to_a
    return nil if list.empty?

    current = Element.new(list.pop)

    list.reverse.each do |datum|
      current = Element.new(datum, current) 
    end

    current
  end

  def reverse
    Element.from_a(self.to_a.reverse)
  end
end
