class Organization < ApplicationRecord
  has_many :user_organizations
  has_many :users, through: :user_organizations

  belongs_to :admin, class_name: 'User'

end
