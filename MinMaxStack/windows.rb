require_relative 'minmaxstackqueue'
def window(arr, window)
  current_max_range = nil
  (0..arr.length - window).each do |idx1|
    subarr = arr[idx1...idx1+window]
    range = subarr.max - subarr.min
    current_max_range = range if current_max_range.nil? || range > current_max_range
  end

  current_max_range
end

def window1(arr, window)
  q = MinMaxStackQueue.new

  window.times { q.enqueue(arr.shift) }
  max_range = q.max - q.min

  until arr.empty?
    q.dequeue
    q.enqueue(arr.shift)
    range = q.max - q.min
    max_range = range if range > max_range
  end

  max_range
end


p window1([1, 0, 2, 5, 4, 8], 2) # 4, 8
p window1([1, 0, 2, 5, 4, 8], 3) # 0, 2, 5
p window1([1, 0, 2, 5, 4, 8], 4) # 2, 5, 4, 8
p window1([1, 3, 2, 5, 4, 8], 5) # 3, 2, 5, 4, 8
