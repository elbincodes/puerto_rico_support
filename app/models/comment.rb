class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :organization, optional: true

  validates :content, presence: true
end
