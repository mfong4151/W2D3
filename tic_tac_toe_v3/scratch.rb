require_relative 'board'
require_relative 'human_player'


#boored = Board.new

#p boored.board #Added this instance meth for debugging purposes
#p boored.valid?([69, 420]) == false
#p boored.empty?([1, 1]) == true
#p boored.place_mark([1, 1], :X)
#p boored.place_mark([1, 1], :O) #Should return an error, comment out to run other items
#boored.print


#Testing rows

#boored = Board.new
#boored.place_mark([0, 0], :X)
#boored.place_mark([0, 1], :X)
#boored.place_mark([0, 2], :X)
#p boored.win_row?(:X) == true
#p boored.win?(:X) == true

#Testing cols

#boored = Board.new
#boored.place_mark([0, 0], :X)
#boored.place_mark([1, 0], :X)
#boored.place_mark([2, 0], :X)
#p boored.win_col?(:X) == true
#p boored.win?(:X) == true


#Testing diagonal
#boored = Board.new
#boored.place_mark([0, 0], :X)
#boored.place_mark([1, 1], :X)
#boored.place_mark([2, 2], :X)
#p boored.win_diagonal?(:X) == true
#p boored.win?(:X) == true
#
#Testing anti diagonal

#boored = Board.new
#boored.place_mark([0, 2], :X)
#boored.place_mark([1, 1], :X)
#boored.place_mark([2, 0], :X)
##p boored.win_diagonal?(:X) == true
##p boored.win?(:X) == true
#
##Testing empty positions
#p boored.empty_positions? == true
#boored = Board.new
#(0...3).each{|i|(0...3).each{|j| boored.place_mark([i, j], :X) } }
#p boored.empty_positions? == false
#
#


p 's'.to_i