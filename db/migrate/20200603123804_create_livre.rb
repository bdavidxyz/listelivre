class CreateLivre < ActiveRecord::Migration[6.0]
  def change
    create_table :livres do |t|
      t.string :titre
      t.string :auteur
      t.datetime :date_emprunt
      t.datetime :date_retour
      t.boolean :est_reserve
      t.string :proprietaire
      t.text :resume
    end
  end
end
