# x = [3,5,1,2,7,9,8,13,25,32]
# sum = 0
# x.each { |i| sum+=i }
# puts sum

# arr = x.reject { |i| i<10 }
# p arr

# *****************************************************************
# x = %w(John KB Oliver Cory Matthew Christopher)
# x.shuffle.each { |name| puts name }

# arr = x.reject { |name| name.length<6 }
# p arr

# *****************************************************************
# arr = ('a'..'z').to_a
# p arr
# arr.shuffle!
# p arr
# p arr.first
# p arr.last
# vowels = ['a', 'e', 'i', 'o','u']
# p "The last letter is a vowel" if vowels.include? arr.last

# *****************************************************************
# arr = Array.new(10) { |i| i=rand(55..100)}
# p arr

# *****************************************************************
# arr = Array.new(10) { |i| i=rand(55..100)}
# arr.sort!
# p arr
# p arr.min
# p arr.max

# *****************************************************************
# x = (0...5).map { |i| i=(65 + rand(26)).chr }.join
# p x

# *****************************************************************
# y = (0...10).map { |i| i=(0...5).map { |i| i=(65 + rand(26)).chr }.join }
# p y
