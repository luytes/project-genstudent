class Service < ApplicationRecord

  has_many :reviews, :dependent => :destroy
  has_many :orders

  # alias_attribute :owner, :user
  alias_attribute :owner, :student
  validates :title, presence: true, uniqueness: true
  validates :category, presence: true
  validates :description, presence: true

  belongs_to :student, optional: true
  validates_associated :student

  monetize :price_pennies

  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  CATEGORIES = ["Content", "Social Media", "Design", "Research"]

end
