class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    store[num] = true
  end

  def remove(num)
    validate!(num)
    store[num] = false
  end

  def include?(num)
    store[num] == true
  end

  private

  def is_valid?(num)
    num.between?(0, (store.length-1))
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num] = num
    true
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    store.include?(num)
  end

  private
  attr_reader :num_buckets
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      store[num] = num  
      @count += 1 
    end
  end

  def remove(num)
  end

  def include?(num)
    store.include?(num)
  end

  private
  attr_writer :count
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % 20]
  end

  def num_buckets
    @store.length
  end

  def resize!
    
  end
end
