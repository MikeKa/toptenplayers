class League < ActiveRecord::Base
	has_many :players
	has_many :seasons, :dependent => :destroy
end