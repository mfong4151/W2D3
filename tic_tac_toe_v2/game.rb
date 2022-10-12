require_relative 'board'
require_relative 'human_player'


class Game
    
    def initialize(*marks)
        @players = marks.map{|mark| @players << HumanPlayer.new(mark)}
        @board = Board.new
        @player_idx = 0
        @curr_player = @players[@player_idx]
    end

    def switch_turn
        @player_idx += 1
        @player_idx = 0 if @player_idx >= @players.length
        @curr_player = @players[player_idx]
        
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