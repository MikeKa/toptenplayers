class AddPlayerRefToPlayername < ActiveRecord::Migration
  def change
    add_reference :players, :playername, index: true, foreign_key: true
  end
end
