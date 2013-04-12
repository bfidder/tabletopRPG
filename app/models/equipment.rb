class Equipment < ActiveRecord::Base
  attr_accessible :name, :type, :value

	belongs_to :character
end
