class Student < ApplicationRecord

  mount_uploader :student_picture, PhotoUploader

  has_many :services
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
