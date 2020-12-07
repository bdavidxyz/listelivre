class WelcomeController < ApplicationController

  def index
    render locals: {
      livres: ListBooks.new.call(current_user)
    }
  end
    
end
