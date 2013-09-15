class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  has_secure_password
  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  
  def key_to
    
  end
end