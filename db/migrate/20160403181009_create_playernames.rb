class CreatePlayernames < ActiveRecord::Migration
  def change
    create_table :playernames do |t|
      t.string :name
      t.string :team
      t.string :amplua
      t.string :photolink

      t.timestamps null: false
    end
  end
end
