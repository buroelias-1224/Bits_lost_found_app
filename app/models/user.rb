class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lost_items

  enum :role, { regular: 0, admin: 1 }
end