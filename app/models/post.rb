class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, as: :parent

  validates :title, :body, :user, presence: true

end
