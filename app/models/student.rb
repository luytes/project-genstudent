class Student < User

  # alias_attribute :owner, :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :category, presence: true
  validates :skills, presence: true
  validates :description, presence: true
  validates :cost, presence: true

  mount_uploader :student_picture, PhotoUploader
  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
