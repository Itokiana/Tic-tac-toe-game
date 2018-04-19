#On crée une classe Board_case qui va nous renseigner l'etat d'une case
#Soit la case est vide(au depart), soit elle a comme valeur X ou O
class Board_case
    attr_accessor :status
    def initialize(status=" ")
        @status = status
    end
end