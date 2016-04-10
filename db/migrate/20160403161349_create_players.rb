class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :golas
      t.integer :assists
      t.references :league, index: true, foreign_key: true
      t.references :season, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
