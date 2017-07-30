class Studentapplication < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true
  validates :major, presence: true
  validates :country, presence: true
  validates :email, presence: true
  validates :skills, presence: true
  validates :city, presence: true
  validates :university, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
