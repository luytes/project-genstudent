class Enquire < ApplicationRecord
  belongs_to :service, optional: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company, presence: true
  validates :message, presence: true
  validates :email, presence: true
  validates :service_id, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
