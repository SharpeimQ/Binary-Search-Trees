# frozen_string_literal: true

# Node Class
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def inspect_node
    print " @data: #{data} " if data
    print " @left: #{left.data} " if left
    print " @right: #{right.data} " if right
  end
end
