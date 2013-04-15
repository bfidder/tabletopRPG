class Equipment < ActiveRecord::Base
  attr_accessible :name, :type, :value

	belongs_to :character

	validates_numericality_of :value, :only_integer => true, :greater_than_or_equal_to => 0
	validates :name, presence: true, uniqueness: true
	validates :type, presence: true
end
