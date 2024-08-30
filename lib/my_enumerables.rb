module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    i = 0
    my_each do |element|
      block.call(element, i)
      i += 1
    end
  end

  def my_select(&block)
    selcted_a = []
    my_each do |element|
      selcted_a.push(element) if block.call(element)
    end
    selcted_a
  end

  def my_all?(&block)
    my_each { |element| return false unless block.call(element) }
    true
  end

  def my_any?(&block)
    my_each {|element| return true if block.call(element)}
    false
  end

  def my_none?(&block)
    my_each {|element| return false if block.call(element)}
    true
  end

  def my_count(&block)
    return self.length unless block_given?

    count = 0
    my_each { |element| count += 1 if block.call(element) }
    count
  end

  def my_map(&block)
    map_a = []
    my_each { |element| map_a.push(block.call(element)) }
    map_a
  end

  def my_inject(memo = nil, &block)
    my_each do |element|
      if memo.nil?
        memo = element
      else
        memo = block.call(memo, element)
      end
    end
    memo
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    i = 0
    while i < length
      block.call(self[i])
      i += 1
    end
    self
  end
end
