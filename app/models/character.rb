class Character < ActiveRecord::Base
  attr_accessible :creator, :name
	
	validates :name, presence: true, uniqueness: true
	validates :creator, presence: true
	
	belongs_to :user

	has_many :attributes  
	has_many :skills
	has_many :equipments
end
