# frozen_string_literal: true

require_relative 'lib/tree'

balanced_bst = Tree.new([1, 2, 3, 4, 5, 6, 7])

p balanced_bst.sorted_a_to_bst(balanced_bst.sorted_a[0], balanced_bst.sorted_a.length)
p balanced_bst.pre_order
