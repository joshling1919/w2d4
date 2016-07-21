def my_min1(arr)
  min = arr.first
  arr.each do |el|
    min = el if arr.none? { |el2| el2 < el }
  end
  min
end

def my_min2(arr)
  min = arr.first
  arr.drop(1).each { |el| min = el if el < min }
  min
end

def subsum1(arr)
  subs = []
  arr.each_with_index do |el1, idx1|
    (idx1...arr.length).each do |idx2|
      subs << arr[idx1..idx2]
    end
  end
  subs.map { |s| s.inject(:+) }.max
end

def subsum2(arr)
  max = 0
  curr_max = 0
  (0...arr.length).each do |idx|
    curr_max = curr_max + arr[idx]
    curr_max = 0 if curr_max < 0
    max = curr_max if curr_max > max
  end
  max
end

def first_anagram?(str1, str2)
  str1_combo = str1.split("").permutation.to_a.map { |el| el.join }
  str1_combo.include?(str2)
end

def second_anagram?(str1, str2)
  s1_copy = str1.dup
  s2_copy = str2.dup
  str1.chars.each_with_index do |letter1, idx1|
    str2.chars.each_with_index do |letter2, idx2|
      if letter1 == letter2
        s1_copy = s1_copy.sub(letter1, '')
        s2_copy = s2_copy.sub(letter1, '')
      end
    end
  end

  s1_copy == s2_copy
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  s1_hash = Hash.new(0)
  s2_hash = Hash.new(0)

  str1.each_char { |letter| s1_hash[letter] += 1 }
  str2.each_char { |letter| s2_hash[letter] += 1 }

  s1_hash == s2_hash
end

def fifth?(str1,str2)
  s1_hash = Hash.new(0)
  s2_hash = Hash.new(0)

  str1.each_char { |letter| s1_hash[letter] += 1 }
  str2.each_char { |letter| s1_hash[letter] -= 1 }

  s1_hash.values.all? { |el| el == 0 }
end

def bad_two_sum?(arr, target)
  (0...arr.length - 1).each do |idx1|
    (idx1 + 1...arr.length).each do |idx2|
      return true if arr[idx1] + arr[idx2] == target
    end
  end
  false
end

def okay_two_sum?(arr, target)
  arr.sort!
  arr.each_with_index do |el, idx|
    search = b_search(arr , target - el)
    return true unless search.nil? || idx == search
  end
  false

end

def b_search(arr, target)
  return nil if arr.length < 1
  mid = arr.length / 2

  case arr[mid] <=> target
  when -1
    prev = b_search(arr.drop(mid + 1), target)
    prev.nil? ? nil : mid + 1 + prev
  when 0
    mid
  when 1
    b_search(arr.take(mid), target)
  end
end

def pair_sum?(arr, target)
  sum_hash = Hash.new(0)
  arr.each { |el| sum_hash[el] += 1 }
  arr.each do |el|
    diff = target - el
    min_key = diff == el ? 2 : 1
    return true if sum_hash[diff] >= min_key
  end
  false 
end
