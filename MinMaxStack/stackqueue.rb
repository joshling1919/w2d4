require_relative 'stack'

class StackQueue

  def initialize
    @store = MyStack.new
    @alt_store = MyStack.new
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.size.times { @alt_store.push(@store.pop) }
    return_el = @alt_store.pop
    @alt_store.size.times { @store.push(@alt_store.pop) }
    return_el
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

end
