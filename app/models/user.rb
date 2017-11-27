class User < ApplicationRecord
  before_create :generate_authentication_token!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :body_masses
  validates :auth_token, uniqueness: true

  def generate_authentication_token!
    # friendly_token is a solution to generate the auth_token that devise offers
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

end
