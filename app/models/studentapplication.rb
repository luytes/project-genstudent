class Studentapplication < ApplicationRecord

  SEX = ["Male", "Female", "Other"]

  mount_uploader :cv, PhotoUploader

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true
  validates :major, presence: true
  validates :country, presence: true
  validates :email, presence: true
  validates :skills, presence: true
  validates :city, presence: true
  validates :university, presence: true
  validates :cv, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  class << self
    def sex
      SEX
    end
  end
end
