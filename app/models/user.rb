class User < ActiveRecord::Base

  attr_accessible :email, :name, :password, :password_confirmation, :twitter, :facebook, :google
  
  has_secure_password
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  
  def key_to
  end
  
  devise :omniauthable, :omniauth_providers => [:facebook]
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['name LIKE ? OR email LIKE ?', search_condition, search_condition])
  end
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
end