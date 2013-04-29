class User < ActiveRecord::Base
  attr_accessible :password, :password_confirmation, :password_digest, :name, :firstname, :lastname, :avatar 
  validates :name, presence: true, uniqueness: true
  has_secure_password
	
	has_many :characters

	#tried to add avatars, got lots of errors
  has_attached_file :avatar
										#:path => "cs446/fidder/#{Rails.env}:url"
  
  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png' ]
end
