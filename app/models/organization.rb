class Organization < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :connections
  has_many :users, through: :connections

  validates :name, presence: true, uniqueness: true
  validates :website, presence: true, uniqueness: true
  validates :info, presence: true
end
