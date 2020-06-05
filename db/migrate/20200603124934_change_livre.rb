class ChangeLivre < ActiveRecord::Migration[6.0]
  def change
    remove_column :livres, :date_emprunt
    remove_column :livres, :date_retour
    remove_column :livres, :est_reserve
    remove_column :livres, :resume
    add_column :livres, :genre, :string, :default => "autre"
  end  
end
