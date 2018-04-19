require_relative 'Player'
require_relative 'Board'
require 'pry'

=begin

cette classe s'occupe de gérer toute la partie. 
À l'initialisation elle créé 2 instance de Player, et 1 instance de Board (l'instance de Board, initialise 9 instances de BoardCases). 
Game s'occupe de finir la partie si un joueur a gagné, de demander aux utilisateurs où ils veulent jouer à chaque tour

=end
    

class Game
    # Initialize le jeux
    def initialize
        @positions = {
            :A1 => [0,0],
            :A2 => [0,1],
            :A3 => [0,2],
            :B1 => [1,0],
            :B2 => [1,1],
            :B3 => [1,2],
            :C1 => [2,0],
            :C2 => [2,1],
            :C3 => [2,2]
        }
        @j1 = Player.new("inconnu",false)
        @j2 = Player.new("inconnu",false)
        @plateau = Board.new
    end
    # permet de lancer le jeux
    def play
        tour = 1
        puts "###################################################################################"
        puts "#                     Bienvenu dans le jeu Tic-tac-toe!!!                         #"
        puts "###################################################################################"
        puts "Veuillez entrer le nom du Joueur X:"
        a = gets.chomp
        puts "Veuillez entrer le nom du Joueur O:"
        b = gets.chomp

        @j1.name = a
        @j2.name = b
    
        while tour != 10 do
            @plateau.view_board
            puts "\n"
            if tour % 2 == 0
                puts "Au tour du joueur O (#{@j2.name.capitalize})"
                p = gets.chomp
                while !@positions[p.upcase.to_sym]  do
                    puts "Cette position n'existe pas #{@j2.name.capitalize}, veuillez resaisir:" 
                    p = gets.chomp
                end
                while @plateau.verify_case(@positions[p.upcase.to_sym]) != " "  do
                    puts "Cette position est deja prise #{@j2.name.capitalize}, veuillez resaisir:" 
                    p = gets.chomp
                end
                @plateau.set_position(@positions[p.upcase.to_sym], "O")
                if @plateau.game_over("O")
                    tour = 10
                    @j2.victory = true
                else
                    tour += 1
                end
            else
                puts "Au tour du joueur X (#{@j1.name.capitalize})"
                p = gets.chomp
                while !@positions[p.upcase.to_sym] do 
                    puts "Cette position n'existe pas #{@j1.name.capitalize}, veuillez resaisir:" 
                    p = gets.chomp
                end
                while @plateau.verify_case(@positions[p.upcase.to_sym]) != " "  do
                    puts "Cette position est deja prise #{@j1.name.capitalize}, veuillez resaisir:" 
                    p = gets.chomp
                end
                @plateau.set_position(@positions[p.upcase.to_sym], "X")
                if @plateau.game_over("X")
                    tour = 10
                    @j1.victory = true
                else
                    tour += 1
                end
            end
            break if @plateau.game_over("X")
        end
    
        @plateau.view_board
    
        if @j1.victory == true
            puts "Bravo #{@j1.name.upcase}! T'as gagné !!!!"
        elsif @j2.victory == true
            puts "Bravo #{@j2.name.upcase}! T'as gagné !!!!"
        else
            puts "Match nul!!!!!"
        end
    end
end
