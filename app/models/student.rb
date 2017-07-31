class Student < ApplicationRecord

  DEGREE = ["BA Bachelor of Arts", "Bsc Bachelor of Science", "BEng Bachelor of Engineering",
            "BA Bachelor of Arts", "BA Bachelor of Arts", "BA Bachelor of Arts",
            "BA Bachelor of Arts"]

  mount_uploader :student_picture, PhotoUploader

  has_many :services, :dependent => :destroy
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  # validates_format_of :email, :with => /\A[^@\s]+@[^@\s]+\z/, :on => :create

  accepts_nested_attributes_for :services

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  class << self
    # Student.degree
    def deg
      DEGREE
    end
  end

end
