require_relative 'board'
require_relative 'human_player'


class Game
    
    def initialize(mark_0, mark_1)
        @p1, @p2 = HumanPlayer.new(mark_0), HumanPlayer.new(mark_1)
        @board = Board.new
        @curr_player = @p1
    end

    def switch_turn
        if @curr_player == @p1
            @curr_player = @p2

        elsif  @curr_player == @p2

            @curr_player = @p1
        end
    end

    def play
        while @board.empty_positions? == true
            @board.print
            position = @curr_player.get_position

            @board.place_mark(position,@curr_player.mark)
            if @board.win?(@curr_player.mark)
                @board.print
                print "WINNER WINNER CHICKEN DINNER " + @curr_player.mark.to_s
                break
            end
            self.switch_turn
        end
        if !@board.win?@curr_player and @board.empty_positions? == false
            print "Drawdayo"
        end
    end

end