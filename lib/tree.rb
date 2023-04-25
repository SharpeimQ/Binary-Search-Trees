# frozen_string_literal: true

require_relative 'node'

# balanced BST class
class Tree
  include Comparable

  attr_accessor :array, :root, :mid

  def initialize(array)
    raise ArgumentError, 'Argument is not an array' unless array.is_a?(Array)

    @array = array.uniq.sort
    @mid = array[(array.length / 2)]
    @root = build_tree(0, array.length)
  end

  def <=>(other = root)
    other.left <=> other.right
  end

  # recursive sort algorithm
  def build_tree(start = 0, enda = array.length)
    return puts 'Not Array' unless array.is_a?(Array)
    return nil if start > enda

    mid = (start + enda) / 2
    root = Node.new(array[mid])

    root.left = build_tree(start, mid - 1)

    root.right = build_tree(mid + 1, enda)

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def pre_order(node = root)
    return if node.nil?

    puts node.data
    pre_order(node.left)
    pre_order(node.right)
  end

  def insert(value, root)
    return Node.new(value) if root.nil?
    raise ArgumentError, 'Argument is a Duplicate' if value == root.data

    if value < root.data
      root.left = insert(value, root.left)
    else
      root.right = insert(value, root.right)
    end
    root
  end
end
