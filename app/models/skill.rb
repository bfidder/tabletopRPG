class Skill < ActiveRecord::Base
  attr_accessible :name, :value
	
	belongs_to :character

	validates_numericality_of :value, :only_integer => true, :greater_than_or_equal_to => 0
	validates :name, presence: true, uniqueness: true
end
