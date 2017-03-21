class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 4 }
  validates :name, presence: true
  validates :password_digest, presence: true
  validate :password_check

  class << self
    def authenticate_with_credentials(email, password)
      user = User.where("lower(email) = ?", email.strip.downcase).first
      p user
      if user && user.authenticate(password)
        return user
      end
      nil
    end
  end

  private

  def password_check
    return throw(:abort) if (password != password_confirmation)
  end

end
