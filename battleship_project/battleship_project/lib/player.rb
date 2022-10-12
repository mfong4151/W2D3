class Player
    def get_move
        p 'enter a position with coordinates separated with a space like `4 7`'
        ui = gets.chomp
        coords = []
        ui.split(' ').each{|i| coords<< i.to_i}
        coords
    end
end
