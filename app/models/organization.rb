class Organization < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :user_organizations
  has_many :users, through: :user_organizations

  validates :name, presence: true, uniqueness: true
  validates :website, presence: true, uniqueness: true
  validates :info, presence: true
end
