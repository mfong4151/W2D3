class Board
    attr_reader :size


    def self.print_grid(matrix)

        matrix.each{|row| puts row.join(' ')}
        
    end

    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n ** 2
        @grid_len = n
    end

    def [](rowcol)
        @grid[rowcol[0]][rowcol[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        ships = 0
        (0...@grid.length).each {|i| ships += @grid[i].count(:S)}
        ships
    end
        ## doesn't work, going to come back to this.
    def attack(pos)
        if self.[](pos) == :S
            self.[]=(pos, :H)
            p 'you sunk my battleship!'

            return true

        else 
            self.[]=(pos, :X)
            return false
        end

    end

    def place_random_ships
        
        quarter_grid = (@size)/4 #Get the number of grid squares

        k = 0
        while k < quarter_grid
            i, j = rand(0...@grid_len), rand(0...@grid_len)
            if @grid[i][j] != :S
                @grid[i][j] = :S
                k += 1
            end
        end
    end

    def hidden_ships_grid
        hidden_grid = Array.new(@grid_len){Array.new(@grid_len, :I)}
        (0...@grid_len).each do |i|
            (0...@grid_len).each do |j|
                if @grid[i][j] == :S
                    hidden_grid[i][j] = :N
                else
                    hidden_grid[i][j] = @grid[i][j]
                end
            end 
        end
        hidden_grid
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid())
    end
end
