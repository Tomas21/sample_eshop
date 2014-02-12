class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.hex[0..5]
  end

end
