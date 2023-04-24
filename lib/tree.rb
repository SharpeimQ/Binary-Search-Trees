# frozen_string_literal: true

require_relative 'node'

# balanced BST class
class Tree
  include Comparable

  attr_accessor :sorted_a, :root, :mid

  def initialize(array)
    @sorted_a = array
    @mid = array[(array.length / 2)]
    @root = sorted_a_to_bst(0, sorted_a.length)
  end

  def <=>(other)
    other.left <=> other.right
  end

  # recursive sort algorithm
  def sorted_a_to_bst(start = 0, enda = sorted_a.length)
    return puts 'Not Array' unless sorted_a.is_a?(Array)
    return nil if start > enda

    mid = (start + enda) / 2
    root = Node.new(sorted_a[mid])

    root.left = sorted_a_to_bst(start, mid - 1)

    root.right = sorted_a_to_bst(mid + 1, enda)
    root
  end

  def pre_order(node = root)
    return if node.nil?

    puts node.data
    pre_order(node.left)
    pre_order(node.right)
  end
end
