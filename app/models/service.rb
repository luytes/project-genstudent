class Service < ApplicationRecord

  belongs_to :student
  has_many :reviews, dependent: :destroy
  # alias_attribute :owner, :user
  alias_attribute :owner, :student
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :rating, inclusion: { in: [1,2,3,4,5], allow_nil: true }

  monetize :price_pennies

  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  CATEGORIES = {
    content: [
      "ceramics", "conceptual art", "digital art", "illustration", "installations",
    "mixed media", "painting", "performance art", "public art", "sculpture", "textiles",
    "video art", "printmaking"
    ],
    social_media: [
      "architecture", "civic design", "graphic design", "interactive design",
    "product design", "typography", "industrial design", "interior design"
    ],
    design: [
      "accessories", "apparel", "childrenswear", "couture", "footwear",
    "jewelry", "pet fashion"
    ],
    research: [
      "action", "animation", "comedy", "documentary", "drama", "experimental", "family",
    "fantasy", "horror", "music videos", "narrative film", "romance", "science fiction",
    "short"
    ]
  }

end
