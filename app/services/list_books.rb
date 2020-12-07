class ListBooks

  def call(current_user)
    
    Livre.all.map do |livre|
      res = {
        titre: livre.titre,
        auteur: livre.auteur,
        genre: livre.genre,
      }    
      if current_user
        res[:proprietaire] = livre.proprietaire
      end
      res
    end

  end
  
end
