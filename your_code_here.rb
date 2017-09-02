class ReimplementEnumerable
  def initialize(collection)
    @collection = collection
  end

  def select
    result = []

    @collection.each do |element|
      should_select = yield(element)
      if should_select
        result << element
      end
    end

    return result
  end

  # The rest of the code for all the enumerables
  # you must write go here

  def all?
    @collection.each do |element|
      items = yield(element)
      if !items
        return false
      end
    end
    return true
  end

  def count
    result = 0
    @collection.each do |element|
      should_count = yield(element)
        if should_count
          result += 1
        end
    end
    return result
  end

  def find
    result = nil
    @collection.each do |element|
      found = yield(element)
      if found
        result = element
      break
      end
    end
    return result
  end

  def each_with_index
    index = 0
    @collection.each do |element|
      yield(element, index)
      index += 1
    end
  end

  def drop(input)
    count = 0
    result = []
    @collection.each do |element|
      if count >= input
        result << element
      end
      count += 1
    end
    return result
  end

  def reject
    result = []
    @collection.each do |element|
      rejected = yield(element)
      unless rejected
        result << element
      end
    end
    return result
  end

  def drop_while
  index = 0
  @collection.each do |element|
    result = yield(element)
    unless result
      return @collection[index..-1]
    end
    index += 1
  end
  return []
  end

  def find_index
    index = 0
    result = nil
    @collection.each do |element|
      to_find = yield(element)
      if to_find
        result = index
        break
      end
      index += 1
    end
    return result
  end

  def include?(input)
    @collection.each do |element|
      if element == input
        return true
      end
    end
    return false
  end
end
