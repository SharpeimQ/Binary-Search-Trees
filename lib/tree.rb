# frozen_string_literal: true

require_relative 'node'

# balanced BST class
class Tree
  attr_accessor :sorted_array, :root

  def initialize(array)
    raise ArgumentError, 'Argument is not an array' unless array.is_a?(Array)

    @sorted_array = array.uniq.sort
    @root = build_tree(0, sorted_array.length - 1)
  end

  def build_tree(start = 0, enda = array.length, array = @sorted_array)
    return puts 'Not Array' unless array.is_a?(Array)
    return nil if start > enda

    mid = (start + enda) / 2
    root = Node.new(array[mid])

    root.left = build_tree(start, mid - 1, array)

    root.right = build_tree(mid + 1, enda, array)

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value)
    h_insert(value)
  end

  def h_insert(value, node = root)
    return Node.new(value) if node.nil?
    raise ArgumentError, 'Argument is a Duplicate' if value == node.data

    if value < node.data
      node.left = h_insert(value, node.left)
    else
      node.right = h_insert(value, node.right)
    end
    node
  end

  def delete(value)
    h_delete(value, root)
  end

  def h_delete(value, node)
    raise ArgumentError, "Value #{value} is not in Tree" if node.nil?
    raise ArgumentError, 'Cannot Delete Root of Tree' if value == root.data

    if value < node.data
      node.left = h_delete(value, node.left)
    elsif value > node.data
      node.right = h_delete(value, node.right)
    elsif value == node.data
      if node.left.nil?
        node = node.right
      elsif node.right.nil?
        node = node.left
      else

        min_node = min_value(node.right)
        node.data = min_node
        node.right = h_delete(min_node, node.right)
      end
    end
    node
  end

  def min_value(node)
    return node.data if node.left.nil?

    node.left = min_value(node.left)
  end

  def find(value)
    node = h_find(value, root)
    puts node.inspect_node
  end

  def h_find(value, node)
    return nil if node.nil?

    if value == node.data
      node
    elsif value < node.data
      h_find(value, node.left)
    elsif value > node.data
      h_find(value, node.right)
    end
  end

  def level_order(node = root)
    return if node.nil?

    queue = []
    result = []
    queue.push(node)

    until queue.empty?
      node = queue.first

      yield node if block_given?

      result << queue.first.data

      queue.push(node.left) if node.left
      queue.push(node.right) if node.right

      queue.shift
    end
    p result.compact
  end

  def inorder(node = root, result = [], &block)
    return if node.nil?

    inorder(node.left, result, &block)
    yield node if block_given?
    result << node.data if node.data
    inorder(node.right, result, &block)

    result
  end

  def pre_order(node = root, result = [], &block)
    return if node.nil?

    yield node if block_given?
    result << node.data if node.data

    pre_order(node.left, result, &block)
    pre_order(node.right, result, &block)

    result
  end

  def post_order(node = root, result = [], &block)
    return if node.nil?

    post_order(node.left, result, &block)
    post_order(node.right, result, &block)

    yield node if block_given?
    result << node.data if node.data

    result
  end

  def height(value)
    discovered_node = h_find(value, root)
    p h_height(discovered_node)
  end

  def h_height(node)
    return -1 if node.nil?

    left_height = h_height(node.left)
    right_height = h_height(node.right)

    left_height > right_height ? left_height + 1 : right_height + 1
  end

  def depth(value)
    p h_depth(value)
  end

  def h_depth(value, node = root, count = 0)
    return count if value == node.data

    if value < node.data
      count += 1
      node.left = h_depth(value, node.left, count)
    elsif value > node.data
      count += 1
      node.right = h_depth(value, node.right, count)
    end
  end

  def balanced?(node = root)
    return true if node.nil?

    left = h_height(node.left)
    right = h_height(node.right)

    return false if (left - right).abs > 1

    # can short-circuit code for optimization as it's boolean
    balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    inorder_arr = inorder
    @root = build_tree(0, inorder_arr.length, inorder_arr)
    pretty_print
  end
end
