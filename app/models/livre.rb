class Livre < ApplicationRecord
  
  enum genre: {
    essai: "essai", 
    roman: "roman", 
    cuisine: "cuisine", 
    dvd: "DVD", 
    bd: "BD", 
    autre: "autre", 
    guide_pratique: "guide pratique", 
    magazine: "magazine", 
    jeu_de_societe: "jeu_de_societe", 
  }

end
