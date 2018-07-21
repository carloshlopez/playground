
##puts "#{0b10101.to_s(2)}"

def getBit(num, i)
  (num & (1 << i)) != 0
end

#puts "Get Bit 25, 5 #{getBit(25, 5)}"

def setBit(num, i)
  num | (1 << i)
end

#puts "SetBit 25, 5: #{setBit(25, 5)}"

def clearBit(num, i)
  mask = ~(1 << i)
  num & mask
end

#puts "clear #{clearBit(255, 5)}"

def clearBitsMSBthroughI(num, i)
  mask = (1 << i) - 1
  num & mask
end

#puts "clearBitsMSBthroughI #{clearBitsMSBthroughI(255, 5)}"

def clearBitsIthrough0(num, i)
  mask = ~((1 << (i + 1)) - 1)
  num & mask
end
#puts "clearBitsIthrough0 #{clearBitsIthrough0(255, 5)}"


def updateBit(num, i, v)
  mask = ~(1 << i)
  num & mask | (v << i)
end

#puts "#{0b10000.to_s(2).length}"

def substitute(n, m, i, j)

end
