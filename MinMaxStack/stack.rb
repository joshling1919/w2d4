
class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop[:val]
  end

  def push(el)
    if empty?
      @store << {val: el, max: el, min: el}

    else
      curr_max = max > el ? max : el
      curr_min = min < el ? min : el
      @store << {val: el, max: curr_max, min: curr_min }
    end
  end

  def peek
    check_last[:val]
  end

  def check_last
    @store.last
  end

  def check_front
    @store.first
  end

  def max
    return nil if empty?
    check_last[:max]
  end

  def min
    return nil if empty? 
    check_last[:min]
  end


  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
