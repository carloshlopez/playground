class LinkedListNode
  attr_accessor :data, :next

  def initialize(data)
    @data = data
  end

  def appendToTail(data)
    endNode = LinkedListNode.new(data)
    n = self
    while n.next != nil
      n = n.next
    end
    n.next = endNode
  end

  def deleteNode(head, data)
    previous = nil
    actual = head
    if(actual.data == data)
      head.next
    else
      while actual.next != nil
        if actual.next.data == data
          actual.next = actual.next.next
          head
        end
        actual = actual.next
      end
      head
    end

  end

  def printList
    n = self
    while n.next != nil
      puts "data #{n.data}"
      n = n.next
    end
    puts "data #{n.data}"
  end

end

# node = LinkedListNode.new(1)
# node.appendToTail(2)
# node.appendToTail(3)
# node.appendToTail(4)
# node.printList
# puts "Delete 3"
# head = node.deleteNode(node, 3)
# head.printList
# puts "Add 3 at tail twice"
# head.appendToTail(3)
# head.appendToTail(3)
# head.printList


def checkPalindrome(node)
  isPalindrome = true
  half = []
  slow = node
  fast = node
  length = 0
  count = 0
  while fast != nil
    half.push(slow.data)
    slow = slow.next
    count += 1
    if fast.next
      fast = fast.next.next
      length += 2
    else
      fast = nil
    end
  end
  isOdd = false
  isOdd = true if length % count != 0
  #slow is in the middle
  #puts "This is slow #{slow.data}"
  #puts "half #{half} length #{length} count #{count} is Odd #{isOdd}"
  if isOdd
    count -= 1
    half.pop
  end
  #Check all posterior from slow, should be egual to half backwards

  while slow != nil
    if slow.data != half[count - 1]
      isPalindrome = false
      break
    end
    count -= 1
    slow = slow.next
  end
  isPalindrome
end

node = LinkedListNode.new(1)
node.appendToTail(2)
node.appendToTail(3)
node.appendToTail(4)
node.appendToTail(5)
node.appendToTail(5)
node.appendToTail(4)
node.appendToTail(3)
node.appendToTail(2)
node.appendToTail(2)

#puts "check isPalindrome #{checkPalindrome(node)}"
