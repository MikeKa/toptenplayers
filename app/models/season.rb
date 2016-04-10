class Season < ActiveRecord::Base
  has_many :players, :dependent => :destroy
  belongs_to :league
end
