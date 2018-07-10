# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

#NumberOfDiscIntersections
# a = [1,5,2,1,4,0]
# numIntersect = 0
# sums = []
# diffs = []
# (0..a.length - 1).each do |i|
#   sums[i] = i + a[i]
#   diffs[i] = i - a[i]
# end
# sums.sort!
# diffs.sort!
# (0..a.length - 1).each do |i|
#   (i+1..a.length - 1).each do |j|
#     numIntersect += 1 if j - a[j] <= i + a[i]
#     if numIntersect > 10000000
#       numIntersect = -1
#       break
#     end
#   end
# end
# puts "Sums #{sums}"
# puts "Difs #{diffs}"
# puts "Num numIntersect #{numIntersect}"
# numIntersect


#String parenthesis well nested
# s = '((()))())))))(((((()'
# # you can write to stdout for debugging purposes, e.g.
# # puts "this is a debug message"
#
# def solution(s)
#     # write your code in Ruby 2.2
#   correct = 0
#   if s.start_with?('(') and s.end_with?(')')
#     numOpen = 0
#     numClose = 0
#     s.each_char do |c|
#       numOpen += 1 if c == "("
#       numClose += 1 if c == ")"
#       break if numClose > numOpen
#     end
#     if numClose != numOpen
#       correct = 0
#     else
#       correct = 1
#     end
#   end
#   correct
#
# end

# Brackets
#
# def solution(s)
#   correct = 0
#   if (s.start_with?('(') and s.end_with?(')')) or
#     (s.start_with?('[') and s.end_with?(']')) or
#     (s.start_with?('{') and s.end_with?('}'))
#     numOpen = 0
#     numClose = 0
#     numBrackOpen = 0
#     numBrackClose = 0
#     numSquareOpen = 0
#     numSquareClose = 0
#     s.each_char do |c|
#       numOpen += 1 if c == "("
#       numClose += 1 if c == ")"
#       numBrackOpen += 1 if c == "{"
#       numBrackClose += 1 if c == "}"
#       numSquareOpen += 1 if c == "["
#       numSquareClose += 1 if c == "]"
#       break if numClose > numOpen or numBrackClose > numBrackOpen or numSquareClose > numSquareOpen
#     end
#     if numClose != numOpen or numBrackClose != numBrackOpen or numSquareClose != numSquareOpen
#       correct = 0
#     else
#       correct = 1
#     end
#   end
#   correct = 1 if s.length < 1
#   correct
# end
#
#
# #s = '{[()()]}'
# #s = '([)()]'
# s = '{{{}}}'
# sol = solution(s)
# puts "For #{s}"
# puts "Solution is: #{sol}"

# Fish

# def solution (a, b)
#   n = a.length
#   dead = []
#   alive = []
#   p = 0
#   q = 1
#   (0..n - 1).each do |i|
#     sizeP = a[p] #p
#     dirP = b[p] #p
#     sizeQ = a[q] #q
#     dirQ = b[q] #q
#     puts "For fishes #{sizeP} and #{sizeQ} going #{dirP} and #{dirQ}"
#     if dirP == 1 and dirQ == 0 and sizeP > sizeQ
#       #p eats q
#       puts "p eats q"
#       a.delete_at(q)
#       b.delete_at(q)
#       dead.push(sizeQ)
#     elsif dirP == 1 and dirQ == 0 and sizeP < sizeQ
#       #q eats p
#       puts "q eats p!"
#       a.shift
#       b.shift
#       dead.push(sizeP)
#     else
#       a.shift
#       b.shift
#       alive.push(sizeP)
#     end
#   end
#   puts "dead #{dead} size #{dead.size}"
#   puts "alive #{alive} size #{alive.size}"
#   alive.size
#
# end
#
# class Fish
#   attr_accessor :size, :direction
#   def initialize (size, direction)
#     @size = size
#     @direction = direction
#   end
# end
#
# def solution(a, b)
#   stack = []
#   (0..a.length - 1).each do |i|
#     stack.push(Fish.new(a[i], b[i]))
#     puts "stack before solving #{stack.inspect}"
#     solveFishStack(stack)
#     puts "stack afert solving #{stack.inspect}"
#   end
#   stack.size
# end
#
# def solveFishStack(stack)
#   unless stack.length < 2
#     (stack.length - 1).downto(1).each do |i|
#
#       if stack[i].direction == stack[i - 1].direction
#         #stack solved
#         break
#       end
#       if stack.length == 1
#         break
#       end
#       puts "stack before solving 1 step #{stack.inspect}"
#       puts "Resolviendo para stack i [#{i}] (size, direction) #{stack[i].size}, #{stack[i].direction}"
#       puts "stack i -1 [#{i - 1}] (size, direction) #{stack[i - 1].size}, #{stack[i - 1].direction}"
#       if stack[i].direction == 0 and stack[i - 1].direction == 1 and stack[i].size < stack[i - 1].size
#         puts "stack i - 1 EATS stack i"
#         stack.delete_at(i)
#       elsif stack[i].direction == 0 and stack[i - 1].direction == 1 and stack[i].size > stack[i - 1].size
#         puts "stack i EATS stack i - 1"
#         stack.delete_at(i - 1)
#       end
#       puts "stack afert solving 1 step #{stack.inspect}"
#     end
#   end
# end


#a = [4, 3, 2, 1, 5]
#b = [0, 1, 0, 0, 0]
# a = [0, 1]
# b = [1, 1]
#
# num = solution(a, b)
# puts "For #{a} and #{b}"
# puts "Num alive is #{num}"

# Stone Wall

# def solution (h)
#   cloneH = h
#   numBlocks = 1
#   n = h.length
#   blockH = cloneH.shift
#   missingH = []
#   while(!cloneH.empty?)
#     actual = cloneH.shift
#     if actual < blockH
#       numBlocks += 1
#       blockH = actual
#     elsif actual > blockH
#       missingH.push(actual)
#       #numBlocks +=1 if(cloneH.length > 1 && cloneH[0] < blockH)
#     end
#     if(cloneH.length == 0)
#       unless missingH.empty?
#         cloneH = missingH
#         missingH = []
#         blockH = cloneH.shift
#         numBlocks += 1
#       else
#         break
#       end
#     end
#
#   end
#   numBlocks
# end

# h = [8,8,5,7,9,8,7,4,8]
# h = [1,5,7,8,3,2]
# h = [1,2,3,4]
# h = [4,5,4,5,4,5]
# h = [4,5,4,5]
# h = [3,2,1]
# h = [5,5,5,5,5,5,5,5,5,5,5,5,5,5]
# num = solution(h)
# puts "Num blocks = #{num}"

# LEADER
# DENOMINATOR
#
# def solution(a)
#   indexDen = -1
#   n = a.length
#   size = 0
#   val = 0
#   (0..n - 1).each do |i|
#     if size == 0
#       size += 1
#       val = a[i]
#     else
#       if val != a[i]
#         size -= 1
#       else
#         size += 1
#       end
#     end
#   end
#   candidate = 2,147,483,648
#   candidate = val if size > 0
#   leader = -1
#   count = 0
#   (0..n - 1).each do |i|
#     if a[i] == candidate
#       count += 1
#       indexDen = i
#     end
#   end
#   leader = candidate if count > n / 2
#   if leader == -1
#     -1
#   else
#     indexDen
#   end
# end
#
# a = [3,4,3,2,3,-1,3,3]
# index = solution(a)
# puts "Index of #{a} is #{index}"

# Equileader

# def solution (a)
#   n = a.length
#   numEquileaders = 0
#   leader = getLeader(a)
#   puts "General Leader #{leader}"
#   unless leader == -1
#     (0..n - 1).each do |i|
#       #if i % 2 == 0
#         puts "Getting leader for #{a[0..i]}"
#         leadA = getLeader(a[0..i])
#         puts "Leader is #{leadA}"
#         puts "Getting leader for #{a[i + 1..n - 1]}"
#         leadB = getLeader(a[i + 1..n - 1])
#         puts "Leader iis #{leadB}"
#         numEquileaders += 1 if leadB == leader and leadA == leader
#       #end
#     end
#   end
#   numEquileaders
# end
#
# def getLeader(a)
#   indexDen = -1
#   n = a.length
#   size = 0
#   val = 0
#   (0..n - 1).each do |i|
#     if size == 0
#       size += 1
#       val = a[i]
#     else
#       if val != a[i]
#         size -= 1
#       else
#         size += 1
#       end
#     end
#   end
#   candidate = 2,147,483,648
#   candidate = val if size > 0
#   leader = -1
#   count = 0
#   (0..n - 1).each do |i|
#     if a[i] == candidate
#       count += 1
#       indexDen = i
#     end
#   end
#   leader = candidate if count > n / 2
#   if leader == -1
#     -1
#   else
#     leader
#   end
# end
#
# a = [4,3,4,4,4,2]
# #a = [1, 2, 3, 4, 5]
# #a = [5, 5, 3, 4, 5, 5, 5, 5, 5, 5, 4, 3, 2, 4, 5, 6, 5, 4, 5, 5, 5]
# num = solution(a)
# puts "Equileaders of #{a} is #{num}"

# Max  slice

# def solution(a)
#   max_ending = 0
#   max_slice = 0
#   a.each do |i|
#     max_ending = [0, max_ending + i].max
#     max_slice = [max_slice, max_ending].max
#   end
#   max_slice
# end
#
# a = [3,2,6,-1,4,5,-1,2]
# a = [5, -7, 3, 5, -2, 4, -1]
# max = solution(a)
# puts "For #{a} this is the max slice #{max}"

#Max double slice
# def solution(a)
#   max_left = Array.new(a.length, 0)
#   max_right = Array.new(a.length, 0)
#   (1..a.length - 1).each do |i|
#     max_left[i] = [0, max_left[i - 1] + a[i]].max
#   end
#   (a.length - 2).downto(0).each do |i|
#     max_right[i] = [0, max_right[i + 1] + a[i]].max
#   end
#
#   puts "Max left  #{max_left}"
#   puts "Max right #{max_right}"
#   max = 0
#   (1..a.length - 2).each do |i|
#     #Max from right + left
#     max = [max, max_left[i - 1] + max_right[i + 1]].max
#   end
#   max
# end
#
# a = [3,2,6,-1,4,5,-1,2]
# #a = [5, -7, 3, 5, -2, 4, -1]
# max = solution(a)
# puts "For #{a} this is the max slice #{max}"

#MAx Profit

# def solution(a)
#   max_ending = 0
#   max_slice = 0
#   sums = calcPreSums(a)
#   puts "Sums #{sums}"
#   (1..a.length - 1).each do |i|
#     max_ending = [0, max_ending + sums[i]].max
#     max_slice = [max_slice, max_ending].max
#   end
#   max_slice
# end
#
# def calcPreSums(a)
#   sums = Array.new(a.length + 1, 0)
#   (1..a.length - 1).each do |i|
#     val = a[i] - a[i - 1]
#     #val = a[i] - a[i - 1] if a[i] >= a[i - 1]
#     sums[i] = val
#   end
#   sums
# end
#
# a =[23171, 21011, 21123, 21366, 21013, 21367]
# maxProfit = solution(a)
# puts "Profit: #{maxProfit}"

#Max Slice sums
#
# def solution(a)
#   # write your code in Ruby 2.2
#   max_edge = -4611686018427387903
#   max_slice = -4611686018427387903
#   (0..a.length - 1).each do |i|
#     max_edge = [a[i], max_edge + a[i]].max
#     max_slice = [max_slice, max_edge].max
#   end
#   max_slice
# end
#
# def calcPreSums(a)
#   sums = Array.new(a.length, 0)
#   (1.. a.length).each do |i|
#     sums[i] = sums[i - 1] + a[i - 1]
#   end
#   sums
# end
#
# a =[3, 2, -6, 4, 0]
# # a = [-1, 10, 3, 4, -3, 12]
#  a = [-10]
# maxSliceSum = solution(a)
# puts "Max slice sum: #{maxSliceSum}"

# Prime numbers

#count factors
# def solution (n)
#   factors = 1
#   (2..Math.sqrt(n).floor).each do |i|
#     factors += 1 if n % i == 0
#     factors += 1 if i * i < n and n % i * i == 0
#     puts "evaluated #{i}"
#   end
#   factors += 1 if n > 1
#   factors
# end
#
# n = 30
# numFactors = solution(n)
# puts "Num factors of #{n} are: #{numFactors}"

# Min perimeter rectangle

# def solution (n)
#   numFactors = 1
#   minPerimeter = 2*(1 + n)
#   (2..Math.sqrt(n).floor).each do |i|
#     newPerimeter = 2*(i + n/i)
#     minPerimeter = newPerimeter if n % i == 0 and newPerimeter < minPerimeter
#     newPerimeter = 2*(i*i + n/i)
#     minPerimeter = newPerimeter if i * i < n and n % i * i == 0 and newPerimeter < minPerimeter
#   end
#   minPerimeter = 0 if n < 1
#   minPerimeter
# end
#
# n = 5
# minPerimeter = solution(n)
# puts "Min perimeter for Area #{n} is: #{minPerimeter}"


#Peaks
#
# class FactorBlock
#   attr_accessor :factor, :blockArray
#   def initialize(factor, blockArray)
#     @factor = factor
#     @blockArray = blockArray
#   end
# end
#
# class Block
#   attr_accessor :initial, :ending
#   def initialize(initial, ending)
#     @ini = initial
#     @end = ending
#   end
# end
#
# def solution (a)
#   peaks = getPeaks(a)
#   #peaks is an array with the peaks indexes, ex [3,5,10], numPeaks = peaks.length
#   puts "Peaks: #{peaks}"
#   maxBlocks = 0
#   if peaks.size > 0
#     factorsWithBlocks = getFactorsWithBlocks(a, peaks.length)
#     #puts "factorsWithBlocks #{factorsWithBlocks}"
#     #factorsWithBlocks is an Array of FactorBlock  , ex
#     #[[[0,1]], [[0,5], [6,11]], [[0,3], [4,7], [8,11]] ]
#     factorsWithBlocks.each do |factor|
#       #Check if in each array of blocks exists a peak
#       puts "A factor #{factor.inspect}"
#       includesSome = false
#       peaks.each do |peak|
#         factor.blockArray.each do |blocks|
#           if blocks and blocks.include?(a[peak])
#             includesSome = true
#           end
#           break if includesSome == false
#         end
#       end
#       puts "Factor includes peak #{includesSome}"
#       maxBlocks = factor.blockArray.size if factor.blockArray.size > maxBlocks and includesSome == true
#       puts "MaxBlocks: #{maxBlocks}"
#     end
#   end
#   maxBlocks
#
#
# end
#
# def getPeaks (a)
#   peaks = []
#   (2..a.length - 1).each do |i|
#     peaks.push(i - 1) if a[i - 1] > a[i] and a[i - 1] > a[i - 2]
#   end
#   peaks
# end
#
# def getFactorsWithBlocks (a, numPeaks)
#   factorsWithBlocks = []
#   arr = Array.new(0)
#   arr.push(a)
#   factor = FactorBlock.new(1, arr)
#   factorsWithBlocks.push(factor)
#   n = a.length
#   edge = [numPeaks, Math.sqrt(n).floor].min
#   (2..edge).each do |i|
#     if n % i == 0
#       factor = FactorBlock.new(i, [])
#       to = n / i - 1
#       from = 0
#       (1..i).each do |j|
#         to = to + from
#         factor.blockArray.push(a[from..to])
#         from = to + 1
#       end
#
#       factorsWithBlocks.push(factor)
#     end
#     k = i * i
#     if k < n and n % k == 0
#       factor = FactorBlock.new(k, [])
#       numElements = n / k
#       to = numElements
#       from = 0
#       (0..numElements).each do |l|
#         to = from + numElements - 1
#         factor.blockArray.push(a[from..to])
#         from = to + 1
#       end
#       factorsWithBlocks.push(factor)
#     end
#   end
#   factorsWithBlocks
# end
#
# a = [1,2,3,4,3,4,1,2,3,4,6,2]
# a = [1, 2, 1, 2]
# numBlocksWithPeaks = solution(a)
# puts "Num blocks with Peaks of #{a} are: #{numBlocksWithPeaks}"


#Flags
#
# def solution (a)
#   maxFlags = 0
#   peaks = getPeaks(a)
#   puts "Peaks #{peaks}"
#   # peakSums = calcPreSums(peaks)
#   # puts "Peaks pres sums #{peakSums}"
#   peakDis = calcDifs(peaks)
#   puts "Peak distances #{peakDis}"
#   numFlags = 0
#   (1..peaks.length).each do |flag|
#     numFlags = 0
#     puts "flag #{flag}"
#     (0..peaks.length - 1).each do |i|
#       numFlags += 1 if peakDis[i] >= flag
#       maxFlags = numFlags if numFlags > maxFlags
#     end
#     puts "numFlags #{numFlags}"
#   end
#   maxFlags
# end
#
# def getPeaks(a)
#   peaks = []
#   (2..a.length - 1).each do |i|
#     peaks.push(i - 1) if a[i - 1] > a[i] and a[i - 1] > a[i - 2]
#   end
#   peaks
# end
#
# def calcDifs(a)
#   sums = Array.new(a.length, 0)
#   (1..a.length - 1).each do |i|
#     sums[i] = (a[i] - a[i - 1]).abs
#   end
#   sums
# end
#
#  a = [1,5,3,4,3,4,1,2,3,4,6,2]
# #a = [1,2,3,4,3,4,1,2,3,4,6,2]
# # a = [1, 2, 1, 2]
# # a = [0, 0, 0, 0, 0, 1, 0, 1, 0, 1]
# maxFlags = solution(a)
# puts "For #{a}, max flags are: #{maxFlags}"


# Sieve of Eratosthenes
# def sieve(n)
#   sieve = Array.new(n + 1,true)
#   sieve[0] = sieve[1] = false
#   i=2
#   while (i * i <= n)
#     if (sieve[i])
#       k=i * i
#       while (k <= n)
#         sieve[k] = false
#         k += i
#       end
#     end
#     i += 1
#   end
#  sieve
# end

#puts "Seive 17 #{sieve(17)}"

#Factorization
#Prepare de array for factorization
# def preapareArrayF(n)
#   f = Array.new(n + 1, 0)
#   i=2
#   while (i * i <= n)
#     if (f[i] == 0)
#       k=i * i
#       while (k <= n)
#         f[k] = i if (f[k] == 0)
#         k += i
#       end
#     end
#     i += 1
#   end
#   f
# end
# #puts "Prepera F array for n = 20: #{preapareArrayF(20)}"
#
# #Factorization of x
# def factorization(x, f)
#   primeFactors = []
#   while(f[x] > 0)
#     primeFactors += [f[x]]
#     x /= f[x]
#   end
#   primeFactors += [x]
#   primeFactors
# end
# f = preapareArrayF(20)
# factors = factorization(20, f)
# #puts "Factors of 20 #{factors}"
#
#
# #Semi Primes in Range
#
# def solution(n, p, q)
#   numSemiPrimes = Array.new(p.length)
#   primesN = sieve(n)
#   puts "Sieve of #{n}: #{primesN}"
#   semiPrimes = getSemiPrimes(primesN)
#   semiPrimes.sort!
#   #semiPrimes = [4, 6, 9, 10, 14, 15, 21, 22, 25, 26, 33, 34, 35, 38, 39, 46, 49, 51, 55, 57, 65, 69, 77, 85, 91, 95, 115, 119, 121, 133, 143, 161, 169, 187, 209, 221, 247, 253, 289, 299, 323, 361, 391, 437, 529]
#   puts "semiPrimes #{semiPrimes}"
#   preSums = calcPreSum(semiPrimes, n)
#   puts "Pre sums semiPrime #{preSums}"
#   (0..p.length - 1).each do |i|
#      #numSemiPrimes[i] = getNumSemiPrimesInRange(semiPrimes, p[i], q[i])
#      numSemiPrimes[i] = preSums[q[i]] - preSums[p[i] - 1]
#   end
#
#   numSemiPrimes
# end
#
# def getNumSemiPrimesInRange(semiPrimes, x, y)
#   num = 0
#   semiPrimes.each do |semiPrime|
#     num += 1 if semiPrime if semiPrime >= x and semiPrime <= y
#     break if semiPrime > y
#   end
#   num
# end
#
# def getSemiPrimes(primes)
#   semiPrimes = []
#   (2..primes.length - 1).each do |i|
#     if primes[i] == true
#       k = i
#       while(k >= 2)
#         semiPrimes.push(k*i) if primes[k]== true
#         k -= 1
#       end
#     end
#   end
#   semiPrimes
# end
#
# def sieve(n)
#   sieve = Array.new(n + 1,true)
#   sieve[0] = sieve[1] = false
#   i=2
#   while (i * i <= n)
#     if (sieve[i])
#       k=i * i
#       while (k <= n)
#         sieve[k] = false
#         k += i
#       end
#     end
#     i += 1
#   end
#  sieve
# end
#
# #Todos, do a presum for the number of primes between range??
#
# def calcPreSum(a, n)
#   sums = Array.new(n + 1, 0)
#   j = 0
#   (1..n).each do |i|
#     if a[j] <= i
#       sums[i] = sums[i -1] + 1
#       j += 1
#     else
#       sums[i] = sums[i -1]
#     end
#   end
#   sums
# end
#
# n = 26
# p = [1,4,16]
# q = [26, 10 ,20]
# semiPrimesInRange = solution(n, p, q)
# puts "SemiPrimes for n, p, q are: #{semiPrimesInRange}"

#Count non divisors
#
# def solution(a)
#   nonDivisors = Array.new(a.length, 0)
#
#   # (0..a.length - 1).each do |i|
#   #   numNon = 0
#   #   (0..a.length - 1).each do |j|
#   #     numNon += 1 if a[i] % a[j] != 0
#   #   end
#   #   nonDivisors[i] = numNon
#   # end
#   max_num = a.max
#   divisors = Array.new(max_num)
#   (0..max_num).each do |i|
#     divisors[i] = Divisors.new(i, [1, i])
#   end
#
#   sieveDiv = sieveDivisor(max_num, divisors)
#   puts "Sieve #{sieveDiv}"
#   (0..a.length - 1).each do |i|
#     if sieveDiv[a[i]]
#       # puts "nonDivisors for #{a[i]} #{[a - sieveDiv[a[i]].arrDivisors.push(1).push(a[i])]} with size #{[a - sieveDiv[a[i]].arrDivisors].size}"
#       nonDivisors[i] = (a - sieveDiv[a[i]].arrDivisors.push(1).push(a[i])).size
#     end
#   end
#
#   nonDivisors
# end
#
# def preapareArrayF(n)
#   f = Array.new(n + 1, 0)
#   i=2
#   while (i * i <= n)
#     if (f[i] == 0)
#       k=i * i
#       while (k <= n)
#         f[k] = i if (f[k] == 0)
#         k += i
#       end
#     end
#     i += 1
#   end
#   f
# end
# #puts "Prepera F array for n = 20: #{preapareArrayF(20)}"
#
# #Factorization of x
# def factorization(x, f)
#   primeFactors = []
#   while(f[x] > 0)
#     primeFactors += [f[x]]
#     x /= f[x]
#   end
#   primeFactors += [x]
#   primeFactors
# end
#
# class Divisors
#   attr_accessor :num, :arrDivisors
#   def initialize(num, array)
#     @num = num
#     @arrDivisors = array
#   end
# end
#
# def sieveDivisor(n, divisors)
#   sieve = Array.new(n + 1,true)
#   sieve[0] = sieve[1] = false
#   i=2
#   while (i * i <= n)
#     if (sieve[i])
#       k=i * i
#       while (k <= n)
#         sieve[k] = false
#         divisors[k] = Divisors.new(k, []) unless divisors[k]
#         divisors[k].arrDivisors.push(i)
#         divisors[k].arrDivisors.push(k / i)
#         k += i
#       end
#     end
#     i += 1
#   end
#  sieve
# end
#
# a = [3, 1, 2, 3, 6]
# nonDiv = solution(a)
# puts "nonDiv #{nonDiv}"

#Euclidian algorithm for Greatest Common Divisor
#
# def gcd_substraction(a, b)
#   return a if a == b
#   if a > b
#     gcd_substraction(a - b, b)
#   else
#     gcd_substraction(a, b - a)
#   end
# end
#
# def gcd_division(a, b)
#   if a % b == 0
#     return b
#   else
#     return gcd_division(b, a % b)
#   end
# end
#
# def gcd_binary(a, b, res)
#   if a == b
#     return res * a
#   elsif (a % 2 == 0) and (b % 2 == 0)
#     return gcd_binary(a / 2, b / 2, 2 * res)
#   elsif (a % 2 == 0)
#     return gcd_binary(a / 2, b, res)
#   elsif (b % 2 == 0)
#     return gcd_binary(a, b / 2, res)
#   elsif a > b
#     return gcd_binary(a - b, b, res)
#   else
#     return gcd_binary(a, b - a, res)
#   end
# end
#
# def lcd(a, b)
#   (a * b) / gcd_binary(a, b, 1)
# end
# #
# # def solutionChocolates(n, m)
# #   lc = lcd(n, m)
# #   lc / m
# # end
#
# # puts "Num chocolates eaten #{solutionChocolates(25, 3)}"
#
#
#
# def solution(a, b)
#   numEquals = 0
#     (0..a.length - 1).each do |i|
#       #lc = lcd([a[i], b[i]].min, [a[i], b[i]].max)
#       min = [a[i], b[i]].min
#       max = [a[i], b[i]].max
#       gcd = gcd_binary(min, max, 1)
#       puts "Eval: #{a[i]}, #{b[i]}"
#       puts "GCD #{gcd}"
#       min = removeOtherFactors(min, gcd)
#       unless min != 1
#         max = removeOtherFactors(max, gcd)
#         numEquals+= 1 if max == 1
#       end
#     end
#   numEquals
# end
#
# def removeOtherFactors(x, y)
#   while x != 1
#     gcd = gcd_binary(x, y, 1)
#     break if gcd == 1
#     x /= gcd
#   end
#   x
# end
#
# a = [15, 10, 3]
# b = [75, 30, 5]
#
# # a = [3, 9, 20, 11]
# # b = [9, 81, 5, 13]
# #expect 2
#
# puts "Num primes equal #{solution(a, b)}"

# Fibonacci numbers
#
# def fibonacci(n)
#   return n if (n <= 1)
#   return fibonacci(n - 1) + fibonacci(n - 2)
# end
#
# def fibonacciDynamic(n)
#   fib = Array.new(n + 2, 0)
#   fib[1] = 1
#   (2..n + 1).each do |i|
#     fib[i] = fib[i - 1] + fib[i - 2]
#   end
#   fib[n]
# end
#
# def fibonacciArray(n)
#   fib = Array.new(n + 2, 0)
#   fib[1] = 1
#   (2..n + 1).each do |i|
#     fib[i] = fib[i - 1] + fib[i - 2]
#   end
#   fib
# end
# #
# #For all the given numbers x0, x1,...,xn≠1, such that 1 ˛ xi ˛ m ˛ 1 000 000,
# #check whether they may be presented as the sum of two Fibonacci numbers.
#
#
#
# def sol(n)
#   areSums = []
#   fibArray = fibonacciArray(n)
#   puts "fibArray #{fibArray}"
#   (1..n).each do |i|
#     areSums.push(i) if checkIfSum(fibArray, i) == true
#   end
#   areSums
# end
#
# def checkIfSum(fibArray, n)
#   isSum = false
#   (0..fibArray.length - 1).each do |i|
#     (0..fibArray.length - 1).each do |j|
#       if fibArray[i] + fibArray[j] == n
#         isSum = true
#         break
#       end
#     end
#   end
#   isSum
# end

#puts "sol35 #{sol(35)}"

#FIB Frog

def fibonacciArray(n)
  fib = Array.new(n + 2, 0)
  fib[1] = 1
  (2..n + 1).each do |i|
    fib[i] = fib[i - 1] + fib[i - 2]
  end
  fib
end

def solution(a)
  minJumps = -1
  position = -1
  n = a.length
  lastLeaf = n
  fibArray = fibonacciArray(n)
puts "fibArray #{fibArray}"
  while(position <= n + 1)
    canJump = canJumpToNFromPosition(position, lastLeaf, fibArray)
    if canJump != -1
      #Jumps from position to lastLeaf
      #if lastLeaf = n DONE
      minJumps += 1
      break if lastLeaf == n

    else
      #Cannot Jump, so find lastLeaf
      lastLeaf = indLastLeaf(a, lastLeaf)
    end
  end
  minJumps
end

def canJumpToNFromPosition(position, n, fibArray)
  canJumpToNFromPosition = - 1
  (0..fibArray.length - 1).each do |i|
    if fibArray[i] = n - position
      canJumpToNFromPosition = i
      break
    end
  end
  canJumpToNFromPosition
end

def findLastLeaf(a, lastLeaf)
  leaf = 0
  a.length.downto(0).each do |i|
    if a[i] = 1
      leaf = i
      break
    end
  end
  leaf
end
