class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :organization, optional: true

  # accepts_nested_attributes_for :comments

  validates :title, presence: true
  validates :content, presence: true

end
