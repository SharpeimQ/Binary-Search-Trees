# frozen_string_literal: true

require_relative 'lib/tree'

bst = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

p bst.root.data
p bst.pretty_print
