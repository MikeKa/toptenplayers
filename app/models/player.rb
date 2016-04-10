class Player < ActiveRecord::Base
  belongs_to :league
  belongs_to :season
  belongs_to :playername
end
