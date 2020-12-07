class Livre < ApplicationRecord
  
  enum genre: {
    essai: "essai", 
    roman: "roman", 
    cuisine: "cuisine", 
    dvd: "DVD", 
    bd: "BD", 
    autre: "autre", 
  }

end
