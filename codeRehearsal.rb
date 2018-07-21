# compress String
#
# def solution(s)
#   lastChar = s[0]
#   newString = StringIO.new
#   count = 0
#   s.chars.each do |char|
#     if char == lastChar
#       count += 1
#     else
#       newString << lastChar << count.to_s
#       count = 1
#       lastChar = char
#     end
#   end
#   newString << lastChar << count.to_s
#   if newString.string.length >= s.length
#     s
#   else
#     newString.string
#   end
# end
# s
# s = "aabcccccaa"
#s = "asdfghjkl"

# puts "Solution #{solution(s)}"

# rotate matrix

def solution(a)
  newMatrix = []
  newMatrix
end

a = [[1, 2, 3],[4, 5, 6],[7,8,9]]

puts "Solution #{solution(a)}"
