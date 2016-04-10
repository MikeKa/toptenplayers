class AddImagelinkAndDescriptionToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :imagelink, :string
    add_column :leagues, :description, :text
  end
end
