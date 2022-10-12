require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        p @board.size/4
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p 'you lose'
            return true
        end
        false
    end

    def win?
        if @board.num_ships == 0
            p 'you win'
            return true
        end
        false
    end

    def game_over?
        return true if self.win? or self.lose?
        false
    end

    def turn
        ui = @player.get_move
        successful = @board.attack(ui)
        @board.print
        @remaining_misses -= 1 if !successful
        p @remaining_misses

    end
end
