# frozen_string_literal: true

require_relative 'lib/tree'

array = []
while array.length < 15
  num = rand(1..100)
  array << num unless array.include?(num)
end

bst = Tree.new(array)

bst.pretty_print
p bst.balanced?
p bst.pre_order
p bst.post_order
p bst.inorder

bst.insert(120)
bst.insert(130)
bst.insert(150)

bst.pretty_print
p bst.balanced?

bst.rebalance
p bst.balanced?
bst.pre_order
bst.post_order
bst.inorder
