require_relative 'Board_case' # On inclue le fichier contenant la classe Board_case

class Board
    @@tab = [] # On creer un tableau,une constante de la classe Board, qui va contenir tout les positions 3x3 des joueurs
    
    def initialize
        # Les 9 instances de Board_case
        case1 = Board_case.new
        case2 = Board_case.new
        case3 = Board_case.new
        case4 = Board_case.new
        case5 = Board_case.new
        case6 = Board_case.new
        case7 = Board_case.new
        case8 = Board_case.new
        case9 = Board_case.new

        # On insert les instances dans le tableau
        @@tab = [[case1,case2,case3],[case4,case5,case6],[case7,case8,case9]]
    end
    
    def set_position(position, player)
         # Si la position est un " ", on insert le joueur dans la case
        if @@tab[position[0]][position[1]].status == " "
            @@tab[position[0]][position[1]].status = player
        end
    end

    # permet de recuperer celui qui occipe la case en question
    def verify_case(position)
        @@tab[position[0]][position[1]].status
    end

    # Verifie si le jeux est fini
    def game_over(player)
        if @@tab[0][0].status == player && @@tab[0][1].status == player && @@tab[0][2].status == player # verifie si des points sont alignés au 1er lignes
            true
        elsif @@tab[1][0].status == player && @@tab[1][1].status == player && @@tab[1][2].status == player # verifie si des points sont alignés au 2é lignes
            true
        elsif @@tab[2][0].status == player && @@tab[2][1].status == player && @@tab[2][2].status == player # verifie si des points sont alignés au 3é lignes
            true
        elsif @@tab[0][0].status == player && @@tab[1][1].status == player && @@tab[2][2].status == player # verifie si des points sont alignés en oblique
            true
        elsif @@tab[0][2].status == player && @@tab[1][1].status == player && @@tab[2][0].status == player # verifie si des points sont alignés en oblique
            true
        elsif @@tab[0][0].status == player && @@tab[1][0].status == player && @@tab[2][0].status == player # verifie si des points sont alignés en vertical sur la colonne 1
            true
        elsif @@tab[0][1].status == player && @@tab[1][1].status == player && @@tab[2][1].status == player # verifie si des points sont alignés en vertical sur la colonne 2
            true
        elsif @@tab[0][2].status == player && @@tab[1][2].status == player && @@tab[2][2].status == player # verifie si des points sont alignés en vertical sur la colonne 3
            true
        else
            false
        end
    end

    # Pour afficher le plateau du jeux
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