class Review < ApplicationRecord
  belongs_to :service
  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: [1,2,3,4,5], allow_nil: false }
  validates :service_id, presence: true

  def average_rating
    self.class.average(:rating).where(:service => self.service)
  end
end
