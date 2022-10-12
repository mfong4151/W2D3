class HumanPlayer

    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position

        accepted_input = (0...3).to_a
        accept_input = false
        until accept_input
            p @mark.to_s + ", please enter the coordinates of your desired placement space in the format 'row<one whitespace>col'"
            ui = gets.chomp
            #For usability, raise an error when they fail to enter a position in the specified format, 
            #such as if they only enter a single number, use letters, or have too many spaces.
            accept_input = true

            begin
                if ui.count(' ') != 1
                    raise ArgumentError.new "I said enter the coordinates for a tic tac toe board, with a single whitespace >:( DO IT PROPERLY NEXT TIME"
                
                elsif !accepted_input.include?ui[0].to_i or !accepted_input.include?ui[2].to_i or ui[1] != ' '
                    raise ArgumentError.new "Enter the coordinates with a value between 0 and 2 for each >:( DO IT PROPERLY NEXT TIME"
                end
                coords= ui.split(' ')

                if coords.length < 2
                    raise ArgumentError.new "Enter TWO COORDINATES "
                end

            rescue
                p 'Please try to give a value again'
                accept_input = false
            end

        end

        coords[0], coords[1] = coords[0].to_i, coords[1].to_i
        coords
    end
end