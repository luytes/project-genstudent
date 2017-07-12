class Service < ApplicationRecord

  has_many :reviews, :dependent => :destroy
  has_many :orders, :dependent => :destroy
  has_many :enquires, :dependent => :destroy

  alias_attribute :owner, :student
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :what_i_need_from_you, presence: true
  validates :what_i_will_do_for_you, presence: true

  belongs_to :student, optional: true
  validates_associated :student

  monetize :price_pennies

  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  CATEGORIES = ["Content", "Social Media", "Design", "Research"]

end
