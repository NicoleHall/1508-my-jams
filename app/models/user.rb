class User < ActiveRecord::Base
  has_secure_password
  has_many :songs

  validates :username, presence: true,
                      uniqueness: true

  enum role: %w(default admin)

end
