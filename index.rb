# frozen_string_literal: true

require_relative 'lib/tree'

bst = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

bst.pretty_print
bst.height(5)
p bst.balanced?
bst.pretty_print
p bst.balanced?
