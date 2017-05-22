class Project < ApplicationRecord

  belongs_to :user
  alias_attribute :owner, :user
  has_many :roles, :dependent => :destroy
  has_many :requests, through: :roles
  validates :title, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :short_description, presence: true
  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  accepts_nested_attributes_for :roles

end
