require_relative 'stack'



class MinMaxStackQueue

  def initialize
    @store = MyStack.new
    @alt_store = MyStack.new
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    if @alt_store.empty? && @store.size == 1
      @store.pop
    elsif @alt_store.empty?
      @store.size.times { @alt_store.push(@store.pop) }
      @alt_store.pop
    else
      @alt_store.pop
    end
  end

  def size
    @store.size + @alt_store.size
  end

  def empty?
    @store.empty? && @alt_store.empty?
  end

  def min
    store_min = @store.min
    alt_min = @alt_store.min
    raise "empty queue" unless store_min || alt_min
    if store_min && alt_min
       min = store_min < alt_min ? store_min : alt_min
    elsif store_min
      store_min
    elsif alt_min
      alt_min
    end
  end

  def max
    store_max = @store.max
    alt_max = @alt_store.max
    raise "empty queue" unless store_max || alt_max
    if store_max && alt_max
       max = store_max > alt_max ? store_max : alt_max
    elsif store_max
      store_max
    elsif alt_max
      alt_max
    end
  end
end
