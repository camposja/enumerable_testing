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
      chimichanga = yield(element)
      if !chimichanga
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
    result
  end

end
