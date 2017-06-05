class Review < ApplicationRecord
  belongs_to :service
  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: [1,2,3,4,5], allow_nil: false }
  validates :service_id, presence: true
end
