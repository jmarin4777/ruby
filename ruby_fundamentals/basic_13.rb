# Print 1-255
# Write a program that would print all the numbers from 1 to 255. 
# for i in 1..255
#     unless i == 255
#         print i, ", "
#     else
#         print i, " "
#     end
# end

# ********************************************************************
# Print odd numbers between 1-255
# Write a program that would print all the odd numbers from 1 to 255.
# for i in 1..255
#     if i%2 == 1
#         print i, ", "
#     end
# end

# ********************************************************************
# Print Sum
# Write a program that would print the numbers from 0 to 255 but this 
# time, it would also print the sum of the numbers that have been 
# printed so far. For example, your output should be something like 
# this:

# New number: 0 Sum: 0
# New number: 1 Sum: 1
# New number: 2 Sum: 3
# New number: 3 Sum: 6
# ...
# New number: 255 Sum: __
# Do NOT use an array to do this exercise.
# sum = 0
# for i in 0..255
#     sum = sum + i
#     puts "New number: #{i} Sum: #{sum}"
# end

# ********************************************************************
# Iterating through an array
# Given an array X, say [1,3,5,7,9,13], write a program that would 
# iterate through each member of the array and print each value on 
# the screen. Being able to loop through each member of the array is 
# extremely important.
# x = [1,3,5,7,9,13]
# for i in x
#     puts i
# end

# ********************************************************************
# Find Max
# Write a program (sets of instructions) that takes any array and 
# prints the maximum value in the array. Your program should also 
# work with a given array that has all negative numbers (e.g. 
# [-3, -5, -7]), or even a mix of positive numbers, negative numbers 
# and zero.
# x = [1, 2, 3, 4, 5]
# y = [-3, -5, -7]
# puts x.max
# puts x.min
# puts y.max
# puts y.min

# ********************************************************************
# Get Average
# Write a program that takes an array, and prints the AVERAGE of the 
# values in the array. For example for an array [2, 10, 3], your 
# program should print an average of 5. Again, make sure you come up
# with a simple base case and write instructions to solve that base 
# case first, then test your instructions for other complicated cases. 
# You can use a length function with this assignment.
# x = [2, 10, 3]
# sum = 0
# for i in x
#     sum = sum + i
# end
# avg = sum/x.length
# puts avg

# ********************************************************************
# Array with Odd Numbers
# Write a program that creates an array 'y' that contains all the 
# odd numbers between 1 to 255. When the program is done, 'y' 
# should have the value of [1, 3, 5, 7, ... 255].
# y = (1..255).reject {|i| i%2 == 0}
# print Array.new(y)

# ********************************************************************
# Greater Than Y
# Write a program that takes an array and returns the number of 
# values in that array whose value is greater than a given value y. 
# For example, if array = [1, 3, 5, 7] and y = 3, after your program 
# is run it will print 2 (since there are two values in the array 
# that are greater than 3).
# def greater arr, y
#     count = 0
#     for i in arr
#         if i>y
#             count += 1
#         end
#     end
#     return "There are #{count} numbers in the given array that are greater than #{y}."
# end
# puts greater [1, 3, 5, 7], 3

# ********************************************************************
# Square the values
# Given any array x, say [1, 5, 10, -2], create an algorithm (sets 
# of instructions) that multiplies each value in the array by itself.
#  When the program is done, the array x should have values that have 
#  been squared, say [1, 25, 100, 4].
# y = [1, 5, 10, -2]
# y.map! {|i| i*i}
# print y

# ********************************************************************
# Eliminate Negative Numbers
# Given any array x, say [1, 5, 10, -2], create an algorithm that 
# replaces any negative number with the value of 0. When the program
#  is done, x should have no negative values, say [1, 5, 10, 0].

# x = [1, 5, 10, -2]
# x.map! { |i| i<0 ? 0 : i }
# print x
# x = [1, 5, 10, -2]
# x.map! { |i| if i<0 then 0 else i end }
# print x

# ********************************************************************
# Max, Min, and Average
# Given any array x, say [1, 5, 10, -2], create an algorithm that
#  returns a hash with the maximum number in the array, the minimum
#   value in the array, and the average of the values in the array.
# x = [1, 5, 10, -2]
# sum = 0
# for i in x
#     sum = sum + i
# end
# avg = sum.to_f/x.length
# y = [x.min, x.max, avg]
# print y

# ********************************************************************
# Shifting the Values in the Array
# Given any array x, say [1, 5, 10, 7, -2], create an algorithm that
#  shifts each number by one to the front. For example, when the
#   program is done, an x of [1, 5, 10, 7, -2] should become 
#   [5, 10, 7, -2, 0].
# x = [1, 5, 10, 7, -2]
# x.shift
# x.push(0)
# print x
# print "\n"

# ********************************************************************
# Number to String
# Write a program that takes an array of numbers and replaces any 
# negative number with the string 'Dojo'. For example, if array x is
#  initially [-1, -3, 2] after your program is done that array should
#   be ['Dojo', 'Dojo', 2].
# x = [-1, -3, 2]
# x.map! { |i| i<0 ? 'Dojo' : i }
# print x 
# print "\n"