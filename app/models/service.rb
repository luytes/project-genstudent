class Service < ApplicationRecord
  belongs_to :user

  alias_attribute :owner, :user
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true

  mount_uploader :picture, PhotoUploader
  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?

end
