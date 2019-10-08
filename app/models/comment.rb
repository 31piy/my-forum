class Comment < ApplicationRecord

  belongs_to :parent, polymorphic: true

end
