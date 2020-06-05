class Livre < ApplicationRecord
  
  enum genre: {
    essai: "essai", 
    roman: "roman", 
    cuisine: "cuisine", 
    bd: "BD", 
    autre: "autre", 
  }

end
