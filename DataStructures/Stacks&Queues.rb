class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end

end

class Stack
  attr_accessor :top, :min

  def pop
    if top != nil
      data = top.data
      @top = top.next
      data
    else
      nil
    end
  end

  def push(data)
    node = Node.new(data)
    node.next = top
    @top = node
    calc_min_push data
  end

  def peek
    @top.data
  end

  def calc_min_push data
    if @min != nil
      @min = data if data < @min
    else
      @min = data
    end
  end

  def calc_min_pop data
    if @min == data
      #@min = find_min #is not O(1)
      #Should implement another stack to keep track of min
    end
  end

  def printStack
    n = @top
    if n != nil
      while n.next != nil
        if n != nil
          puts "data #{n.data}"
          n = n.next
        end
      end
      puts "data #{n.data}"
    else
      puts "Empty"
    end
  end

end
#
# s = Stack.new
#
# s.push(3)
# puts "min #{s.min}"
# s.push(2)
# puts "min #{s.min}"
# s.printStack
# puts "adding 3 and 4"
# s.push(3)
# s.push(4)
# s.printStack
# puts "poping"
# s.pop
# s.printStack
# puts "Peek #{s.peek}"



class Queue
  attr_accessor :first, :last

  def enqueque data
    if first == nil
      @last = Node.new(data)
      @first = @last
    else
      @last.next = Node.new(data)
      @last = @last.next
    end
  end

  def dequeque
    if @first != nil
      data = @first.data
      @first = @first.next
      data
    else
      nil
    end
  end


  def printQueue

    if @first != nil
      n = @first
      while n.next != nil
        if n != nil
          puts "data #{n.data}"
          n = n.next
        end
      end
      puts "data #{n.data}"
    else
      puts "Empty"
    end
  end
end
#
# q = Queue.new
# q.enqueque(1)
# q.enqueque(2)
# q.enqueque(3)
# q.printQueue
# puts "dequeque"
# q.dequeque
# q.printQueue

class SetOfStacks
  attr_accessor :stacks, :maxItems, :itemsPerStack, :actualStack

  def initialize (max)
    @maxItems = max
    @stacks = []
    @actualStack = 0
    @stacks[0] = Stack.new
    @itemsPerStack = {}
    @itemsPerStack[0] = 0
  end

  def push data
    s = @stacks[@actualStack]
    num = @itemsPerStack[@actualStack]
    if num + 1 <= maxItems
      s.push(data)
      @itemsPerStack[@actualStack] += 1
    else
      #create a new stack
      @actualStack += 1
      newStack = Stack.new
      newStack.push(data)
      @stacks[@actualStack] = newStack
      @itemsPerStack[@actualStack] = 1
    end
  end

  def pop
    s = @stacks[@actualStack]
    num = @itemsPerStack[@actualStack]
    if num > 0
      @itemsPerStack[@actualStack] -= 1
      s.pop
    else
      @stacks[@actualStack] = nil
      @itemsPerStack[@actualStack] = 0
      @actualStack -= 1
      @itemsPerStack[@actualStack] -= 1
      @stacks[@actualStack].pop
    end
  end

  def popAt index
    if @stacks[index]
      if @itemsPerStack[index] > 0
        @itemsPerStack[index] -= 1
        @stacks[index].pop
      end
    else
      nil
    end
  end

end

setOfS = SetOfStacks.new(2)
setOfS.push(1)
setOfS.push(2)
setOfS.push(3)
setOfS.push(4)
setOfS.push(5)
puts "#{setOfS.pop}"
puts "#{setOfS.pop}"
puts "#{setOfS.pop}"
setOfS.push(5)
puts "#{setOfS.popAt(0)}"
setOfS.push(15)
puts "#{setOfS.pop}"
puts "Set Of #{setOfS.inspect}"

puts "Fixnum #{::Fixnum}"
