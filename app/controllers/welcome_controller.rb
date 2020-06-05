class WelcomeController < ApplicationController

  def index
    livres = Livre.all.map do |livre|
      {
        titre: livre.titre,
        auteur: livre.auteur,
        proprietaire: livre.proprietaire,
        genre: livre.genre,
      }
    end
    render locals: {
      livres: livres
    }

  end
    
end
