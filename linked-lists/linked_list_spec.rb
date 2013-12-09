require_relative 'spec_helper'
require_relative 'linked_list'

describe 'Deque' do

  it 'can push and pop' do
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    expect(deque.pop()).to eq(20)
    expect(deque.pop()).to eq(10)
  end

  it 'can push and shift' do
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    expect(deque.shift()).to eq(10) 
    expect(deque.shift()).to eq(20) 
  end

  it 'can shift and unshift' do
    deque = Deque.new
    deque.unshift(10)
    deque.unshift(20)
    expect(deque.shift()).to  eq(20)
    expect(deque.shift()).to  eq(10)
  end

  it 'can unshift and pop' do
    deque = Deque.new
    deque.unshift(10)
    deque.unshift(20)
    expect(deque.pop()).to  eq(10)
    expect(deque.pop()).to  eq(20)
  end

  it 'works with a full example' do
    deque = Deque.new
    deque.push(10)
    deque.push(20)
    expect(deque.pop()).to eq(20) 
    deque.push(30)
    expect(deque.shift()).to eq(10) 
    deque.unshift(40)
    deque.push(50)
    expect(deque.shift()).to eq(40) 
    expect(deque.pop()).to eq(50) 
    expect(deque.shift()).to eq(30) 
  end

end
