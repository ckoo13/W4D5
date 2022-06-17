require "byebug"

def bad_two_sum?(array, target) #O(n^2)
    (0...array.length - 1).each do |i|
        j = i + 1
        while j < array.length
            if array[i] + array[j] == target
                return true
            end

            j += 1
        end
    end

    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(array, target) #O(log n) b/c bsearch + quicksort are both O(log n)
    sorted = array.sort #O(log n)

    return target == sorted.first if sorted.length <= 1

    mid = sorted.length / 2

    if sorted[mid - 1] + sorted[mid] == target
        return true
    elsif sorted[mid - 1] + sorted[mid] < target
        okay_two_sum?(sorted[0...mid], target)
    else
        okay_two_sum?(sorted[mid + 1..-1], target)
    end

    false

end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false
 
def two_sum?(arr, target) #O(n)
    return false if arr.length <= 1

    hash = Hash.new(0)

    arr.each do |ele| #O(n)
        difference = target - ele

        if hash.has_key?(difference)
            return true
        else
            hash[ele] += 1
        end
    end

    false

end

arr = [0, 1, 5, 7, 8, 9, 10, 11, 9, 10]
p two_sum?(arr, 15) # => should be true
p two_sum?(arr, -4) # => should be false