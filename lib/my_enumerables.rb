module Enumerable
  def my_each_with_index
    index = 0
    my_each do |elem| 
      yield(elem, index)
      index += 1
    end 
    self
  end

  def my_select
    selected = []
    my_each do |elem|
      selected << elem if yield(elem)
    end
    selected
  end

  def my_all?
    my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_none?
    my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_count
    return length unless block_given?
    count = 0
    my_each do |elem|
      count += 1 if yield(elem)
    end
    count
  end

  def my_map
    mapped = []
    index = 0
    my_each do |elem|
      mapped << yield(elem)
      index += 1
    end
    mapped
  end

  def my_inject(start_value = nil)
    acc = start_value ? start_value : self[0] - self[0]
    my_each do |elem|
      acc = yield(acc, elem)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for i in self
      yield(i)
    end
    self
  end
end
