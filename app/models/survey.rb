class Survey < ApplicationRecord
  CATEGORIES = ["Content", "Social Media", "Design", "Research"]
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  # validates :subcategory, presence: true
  validates :presence, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  class << self
    def categories
      CATEGORIES
    end
  end
end
