class User < ApplicationRecord
  has_secure_password

  has_many :posts
  has_many :comments, through: :posts

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :phone, presence: true, length: {is: 10}
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }

  def to_s
    "#{first_name} #{last_name}"
  end

end
