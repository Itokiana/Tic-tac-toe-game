#Voici la classe du joueur qui a comme attribut son nom et son etat de victoire
class Player
    attr_accessor :name, :victory
    def initialize(name, victory)
        @name = name
        @victory = victory
    end
end