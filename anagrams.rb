require "byebug"

def first_anagram?(str1, str2) #O(n!)
    #generates anagrams
    anagrams = str1.split("").permutation.to_a #O(n!)

    anagrams.each do |arr| #O(n)
        if arr.join("") == str2
            return true
        end
    end

    false
end 

# p first_anagram?("cat", "act")


def second_anagram?(str1, str2) #O(n ^ 2)

    str1.each_char.with_index do |char, i| #O(n)
        if str2.index(char).nil?
            return false
        else
            str2.delete!(char) #O(n)
        end
    end

    if str2.length == 0
        return true
    end
end

# p second_anagram?("catere", "act")

def third_anagram?(str1, str2) #O(log n)

    arr1 = str1.split("").sort #O(log n)

    arr2 = str2.split("").sort #O(log n)

    arr1 == arr2
end

# p third_anagram?("cat", "act")

def fourth_anagram?(str1, str2)
    hash = Hash.new(0)

    str1.each_char do |ele|
        hash[ele] += 1
    end

    str2.each_char do |ele|
        hash[ele] -= 1
    end

    # debugger
    hash.each_value do |v|
        if v < 0
            return false
        end
    end

    true

end 

p fourth_anagram?("cat", "cat")