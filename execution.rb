require "byebug"

#Phase I
def my_min(list) #O(n^2)
    #nested loop

    #create an answer variable and set it to the first element of the array
    answer = list.first

    list.each_with_index do |ele, idx1| #O(n)
        idx2 = idx1 + 1

        while idx2 < list.length #O(n)
            if list[idx2] < answer
                answer = list[idx2]
            end

            idx2 += 1
        end
    end

    answer
end 

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


#Phase 2 
def my_min2(list) #O(n)
    #set a variable at the start to keep track of minimum
    min = list.first

    #iterate from second element to the end
    (1...list.length).each do |i| #O(n)
        if list[i] < min
            min = list[i]
        end
    end

    min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min2(list)  # =>  -5


#Phase 1
def largest_contiguous_subsum(list)
    subs = []

    (0...list.length).each do |start_idx|
        (start_idx...list.length).each do |end_index|
            subs << list[start_idx..end_index]
        end
    end
    subs 

    sum = 0 

    subs.each do |sub|
        sum = sub.sum if sub.sum > sum 
    end
    
    sum 
end

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8


#Phase 2
def largest_contiguous_subsum2(list)
    #edge case
    return list.sum if list.length <= 1

    #create a variable to hold the return max sum
    max_sum = list.first

    #remember that we want to find the largest sum possible, not the sub array itself

    #iterate through each element in the array
        #if the prefix (or previous temp_sum is negative --> we know it won't help so we can get rid of it)
    
    temp_sum = 0

    for i in list do
        if temp_sum < 0
            temp_sum = 0
        end

        temp_sum += i

        max_sum = temp_sum if temp_sum > max_sum
    end
    
    max_sum
end

list = [-2,-1]
p largest_contiguous_subsum2(list) # => 8 (from [7, -6, 7])