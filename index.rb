# frozen_string_literal: true

require_relative 'lib/tree'

bst = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

bst.insert(12)
bst.pretty_print
bst.insert(60)
bst.pretty_print
bst.delete(4)
bst.pretty_print
bst.find(5)
bst.level_order
p bst.inorder
p bst.post_order
bst.height(8)
