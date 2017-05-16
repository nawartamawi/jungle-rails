class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 5}, allow_nil: true
  validates :email, presence:true, uniqueness: true
  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else 
      nil
    end  
  end 

end
