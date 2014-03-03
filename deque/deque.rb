require_relative '../simple-lists/simple_linked_list'

class Deque
  attr_reader :list

  def push(datum)
    @list = Element.new(datum, @list)
  end

  def pop
    return nil if @list.nil?
    datum = @list.datum
    @list = @list.next
    datum
  end

  def shift
    return nil if @list.nil?
    current = @list
    datum = current.datum
    while current.next != nil
      current = current.next
      datum = current.datum
    end
    current.previous.next = nil if current.previous != nil
    datum
  end

  def unshift(datum)
    elem = Element.new(datum, nil)
    if @list != nil
      current = @list
      while current.next != nil
        current = current.next
      end
      current.next = elem
    else
      @list = elem
    end
  end
end
