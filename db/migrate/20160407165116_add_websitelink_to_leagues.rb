class AddWebsitelinkToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :websitelink, :string
  end
end
