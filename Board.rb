require_relative 'Board_case'

class Board
    @@players = []
    @@tab = []
    
    def initialize
        case1 = Board_case.new
        case2 = Board_case.new
        case3 = Board_case.new
        case4 = Board_case.new
        case5 = Board_case.new
        case6 = Board_case.new
        case7 = Board_case.new
        case8 = Board_case.new
        case9 = Board_case.new

        @@tab = [[case1,case2,case3],[case4,case5,case6],[case7,case8,case9]]
    end
    
    def set_position(position, player)
        if @@tab[position[0]][position[1]].status == " "
            @@tab[position[0]][position[1]].status = player
        end
    end
    def verify_case(position)
        @@tab[position[0]][position[1]].status
    end
    def game_over(player)
        if @@tab[0].select {|x| x.status =~ /player/}.count == 3
            true
        elsif @@tab[1].select {|x| x.status =~ /player/}.count == 3
            true
        elsif @@tab[2].select {|x| x.status =~ /player/}.count == 3
            true
        elsif @@tab[0][0].status == player && @@tab[1][1].status == player && @@tab[2][2].status == player
            true
        elsif @@tab[0][2].status == player && @@tab[1][1].status == player && @@tab[2][0].status == player
            true
        elsif @@tab[0][0].status == player && @@tab[1][0].status == player && @@tab[2][0].status == player
            true
        elsif @@tab[0][1].status == player && @@tab[1][1].status == player && @@tab[2][1].status == player
            true
        elsif @@tab[0][2].status == player && @@tab[1][2].status == player && @@tab[2][2].status == player
            true
        else
            false
        end
    end

    def view_board
        row = ["A","B","C"]
        i = 0
        puts "     1   2   3"
        puts "   -------------"
        @@tab.each do |y|
            puts "#{row[i]}: | #{y[0].status} | #{y[1].status} | #{y[2].status} |"
            puts "   -------------"
            i +=1
        end
    end
end