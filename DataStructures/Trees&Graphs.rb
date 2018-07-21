#Algorith to see if there is a route between 2 nodes

class Node
  attr_accessor :nodes, :value

  def initialize(value)
    @value = value
    @nodes = []
  end

  def connect node
    @nodes.push(node)
  end

end

#should receive a visited hash with false for every node of graph
def isRoute (nodeA, nodeB, visited)
  visited[nodeA.value] = true
  isRoute = false
  if nodaA.value == nodeB.value
    isRoute = true
  end
  if nodeA.nodes == nil
    isRoute = false
  else
    if !isRoute
      nodeA.nodes.each do |node|
        if node.value == nodeB.value
          isRoute = true
          break
        end
      end
      if !isRoute
        nodeA.nodes.each do |node|
          visited[node] = true
          isRoute(node, nodeB, visited) if visited[node] == false
        end
      end
    end
  end
  isRoute
end

#Given a sorted (increasing order) array with unique integer elements, write an algo-
#rithm to create a binary search tree with minimal height.
class TreeNode
  attr_accessor :root, :left, :right
  def initialize(value)
    @root = value
  end

  def printTree
    #inOrder
    self.left.printTree if self.left != nil
    puts "Value #{@root}"
    self.right.printTree unless self.right == nil
  end
end

def insertFromArray(array, start, ending)
  if ending < start
    nil
  else
    mid = (start + ending) / 2
    root = TreeNode.new(array[mid])
    root.left = insertFromArray(array, start, mid - 1)
    root.right = insertFromArray(array, mid + 1, ending)
    root
  end
end

def bstFromArray(a)
  bts = insertFromArray(a, 0, a.length - 1)
  bts
end

a = [5, 6, 7, 8, 12, 17, 20, 36]
bts = bstFromArray(a)
#bts.printTree

#Create a linked list of all the nodes at each depth

require_relative 'LinkedList'

def creatLinkedLists(tree)
  depth = 0
  lists = []
  creatLinkedListsDepth(tree, depth, lists)
  lists
end

def creatLinkedListsDepth(subTree, depth, lists)
  if lists[depth] == nil
    lists[depth] = LinkedListNode.new(subTree.root)
  else
    lists[depth].appendToTail(subTree.root)
  end
  creatLinkedListsDepth(subTree.left, depth + 1, lists) if subTree.left != nil
  creatLinkedListsDepth(subTree.right, depth + 1, lists) if subTree.right != nil
end


lists = creatLinkedLists(bts)

# puts "lists #{lists.length}"
# puts "#{lists[0].printList}"
# puts "#{lists[1].printList}"
# puts "#{lists[2].printList}"
# puts "#{lists[3].printList}"

#check if tree is a BST

def checkIsBST(tree)
  if tree == nil
    true
  else
    left = true
    right = true
    left = tree.root >= tree.left.root if tree.left != nil
    right = tree.root < tree.right.root if tree.right != nil
    if left and right
      checkIsBST(tree.left) && checkIsBST(tree.right)
    else
      false
    end
  end
end

#checkBST with edges, since in last solution we only checked root against it's childern, not ALL the children's children

def checkBSTWithMinMax(tree, min, max)
  if tree == nil
    true
  else
    if tree.root <= min or tree.root > max
      false
    else
      if !checkBSTWithMinMax(tree.left, min, tree.root) or !checkBSTWithMinMax(tree.right, tree.root, max)
        false
      else
        true
      end
    end
  end

end


def newCheckBTS(tree)
  checkBSTWithMinMax(tree, -4611686018427387903, 4611686018427387903)
end

puts "checkIsBST #{checkIsBST(bts)} #{newCheckBTS(bts)}"
