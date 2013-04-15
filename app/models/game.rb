class Game < ActiveRecord::Base
  attr_accessible :GM, :name

	has_many :users
	has_many :characters
end
