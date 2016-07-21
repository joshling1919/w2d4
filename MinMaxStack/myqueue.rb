class MyQueue
  def initalize
    @store = []
  end

  def enqueue(element)
    @store << element
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end
