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
    puts "| @data: #{data} | @left: #{left.data} | @right: #{right.data} |"
  end
end
