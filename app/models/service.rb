class Service < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :destroy
  alias_attribute :owner, :user
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :rating, inclusion: { in: [1,2,3,4,5], allow_nil: false }


  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  CATEGORIES = {
    art: [
      "ceramics", "conceptual art", "digital art", "illustration", "installations",
    "mixed media", "painting", "performance art", "public art", "sculpture", "textiles",
    "video art", "printmaking"
    ],
    design: [
      "architecture", "civic design", "graphic design", "interactive design",
    "product design", "typography", "industrial design", "interior design"
    ],
    fashion: [
      "accessories", "apparel", "childrenswear", "couture", "footwear",
    "jewelry", "pet fashion"
    ],
    film: [
      "action", "animation", "comedy", "documentary", "drama", "experimental", "family",
    "fantasy", "horror", "music videos", "narrative film", "romance", "science fiction",
    "short"
    ],
    journalism: [
      "audio", "photo", "video", "print", "web"
    ],
    music: [
      "blues", "chiptune", "classical music", "comedy", "country & folk", "electronic music",
    "faith", "hip-hop", "indie rock", "jazz", "kids", "latin", "metal", "pop", "punk",
    "r&b", "rock", "world music"
    ],
    photography: [
      "animals", "fine art", "nature", "people", "places"
    ],
    technology: [
      "3d printing", "apps", "diy electronics", "fabrication tools",
    "gadgets", "hardware", "robots", "software", "game design", "sound", "web"
    ],
    theater: [
      "comedy", "experimental", "immersive", "musical", "plays",
    "set design", "dance"
    ]
  }

end
