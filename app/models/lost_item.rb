class LostItem < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, :description, :location, :status, presence: true
  validates :status, inclusion: { in: %w[Lost Found Returned] }
end
