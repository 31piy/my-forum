class User < ApplicationRecord

  has_many :posts

  validates :name, :username, presence: true

end
