# frozen_string_literal: true

# Node Class
class Node
  attr_accessor :data, :next_value

  def initialize(data = nil, next_value = nil)
    @data = data
    @next_value = next_value
  end
end
