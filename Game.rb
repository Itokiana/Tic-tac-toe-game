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
        @plateau = nil
    end
    # permet de lancer le jeux
    def play
        rematch = true
        while rematch == true do
            @plateau = Board.new
            tour = 1
            puts "###################################################################################"
            puts "#                     Bienvenu dans le jeu Tic-tac-toe!!!                         #"
            puts "###################################################################################"
            puts "Veuillez entrer le nom du Joueur X:"
            a = gets.chomp # On demande le nom du premier joueur
            puts "Veuillez entrer le nom du Joueur O:"
            b = gets.chomp # On demande le nom du second joueur
    
            @j1.name = a # On enregistre le nom du premier joueur
            @j2.name = b # On enregistre le nom du second joueur
        
            while tour != 10 do
                @plateau.view_board # On affiche le plateau de jeux
                puts "\n"
                if tour % 2 == 0 # Quand c'est le tour du deuxieme joueur
                    puts "Au tour du joueur O (#{@j2.name.capitalize})"
                    p = gets.chomp # On l'invite a saisir une position

                    # Tant que la case n'existe pas, on demande au joueur O de resaisir une position existante
                    while !@positions[p.upcase.to_sym]  do 
                        puts "Cette position n'existe pas #{@j2.name.capitalize}, veuillez resaisir:" 
                        p = gets.chomp
                    end

                    # Tant que la case n'est pas vide on l'invite a choisir une autre case
                    while @plateau.verify_case(@positions[p.upcase.to_sym]) != " "  do
                        puts "Cette position est deja prise #{@j2.name.capitalize}, veuillez resaisir:" 
                        p = gets.chomp
                    end

                    # On attribue la case au joueur O
                    @plateau.set_position(@positions[p.upcase.to_sym], "O")

                    # On verifie si le joueur O gagne
                    if @plateau.game_over("O") # Si oui, on arrete le jeux et le joueur O gagne
                        tour = 10
                        @j2.victory = true
                    else
                        tour += 1 # Sinon, on passe au tour suivant
                    end
                else
                    puts "Au tour du joueur X (#{@j1.name.capitalize})"# Quand c'est le tour du premier joueur
                    p = gets.chomp # On l'invite a saisir une position

                    # Tant que la case n'existe pas, on demande au joueur X de resaisir une position existante
                    while !@positions[p.upcase.to_sym] do 
                        puts "Cette position n'existe pas #{@j1.name.capitalize}, veuillez resaisir:" 
                        p = gets.chomp
                    end

                    # Tant que la case n'est pas vide on l'invite a choisir une autre case
                    while @plateau.verify_case(@positions[p.upcase.to_sym]) != " "  do
                        puts "Cette position est deja prise #{@j1.name.capitalize}, veuillez resaisir:" 
                        p = gets.chomp
                    end

                    # On attribue la case au joueur O
                    @plateau.set_position(@positions[p.upcase.to_sym], "X")

                    # On verifie si le joueur X gagne
                    if @plateau.game_over("X")# Si oui, on arrete le jeux et le joueur X gagne
                        tour = 10
                        @j1.victory = true
                    else
                        tour += 1 # Sinon, on passe au tour suivant
                    end
                end
            end
        
            # On affiche le resultat du plateau de jeu final
            @plateau.view_board
        
            # On check ce qui a gagne ou si c'etait un match nul
            if @j1.victory == true
                puts "Bravo #{@j1.name.upcase}! T'as gagné !!!!"
            elsif @j2.victory == true
                puts "Bravo #{@j2.name.upcase}! T'as gagné !!!!"
            else
                puts "Match nul!!!!!"
            end

            # On invite les joueurs a faire une autre partie
            puts "\n\nFaire une revenche?\n1- Oui\n2- Non"
            v = gets.chomp
            quit = false
            while quit != true do
                if v == "1"
                    quit = true
                elsif v == "2"
                    quit = true
                    rematch = false
                    puts "Merci d'etre passe !!! :)"
                else
                    quit = false
                    puts "\n\nTapez:\n1- Pour recommencer\n2- Pour quitter"
                    v = gets.chomp
                end
            end
        end
    end
end
