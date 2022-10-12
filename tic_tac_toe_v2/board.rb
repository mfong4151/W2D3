class Board
    ### added this in for debugging purposes
    attr_reader :board

    def initialize
        
        accepted_input = false
        while !accepted_input
            p 'Please enter the width of your board'
            ui = gets.chomp.to_i
            accepted_input = true

            begin
                if ui <= 0
                    raise ArgumentError.new "Please enter a number, a number over 0"
                end
            rescue
                p 'Try again'
                accepted_input = false
            end

        end
        @dimen = ui
        @board = Array.new(ui){Array.new(ui, '_')}
    end


    def valid?(position)
        return false if position[0] > @dimen or position[0] < 0 or  position[1] > @dimen or position[1] < 0 
        true
    end

    def empty?(position)
        return false if @board[position[0]][position[1]] != '_'
        true
    end

    def place_mark(position, mark)
        accept_input = false
        unless accept_input

            begin
                if !self.valid?(position) or !self.empty?(position)
                    raise ArgumentError.new "Can't put a piece at " + position.to_s + ", choose somewhere else"
                end 
            rescue
                'Please try again to give the correct input'
            end
            accept_input = true
        end
        @board[position[0]][position[1]] = mark
    end

    def print
        board.each{|row|p row}        
    end

    def win_row?(mark)
        @board.each{|row| return true if row.all?{|i| i == mark}}
        false
    end

    def win_col?(mark)
        @board.transpose.each  do |col| 
            return true if col.all?{|i| i == mark} 
        end
        false
    end

    def win_diagonal?(mark) #I HATE SQUAREAGONAL O(N solution)
        
        diag, anti = false, false

       
        j = @board.length - 1
        diag = true if @board[0][0] == mark
        anti = true if @board[-1][0] == mark

        (0...@board.length).each do |i|
            diag = false if @board[i][i] != @board[0][0]  #check diagonal
            anti = false if @board[j][i] != @board[-1][0] #check anti diagonal
            j -= 1
        end
        res = diag or anti
        return res
    end
    
    def win?(mark)
        return true if self.win_row?(mark) or self.win_col?(mark) or self.win_diagonal?(mark)
        false
        
    end

    def empty_positions? #could also be done with any, but im optimizing for time

        dimension = board.length
        (0...dimension).each{|i| (0...dimension).each{|j| return true if board[i][j] == '_'}  }
        false
    end
end