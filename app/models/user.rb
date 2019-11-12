class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 1, maximum: 50 }
  validates :email, presence: true, length: { minimum: 5, maximum: 255 }

end
