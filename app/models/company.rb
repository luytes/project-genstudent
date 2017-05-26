class Company < User
  # belongs_to :user

  # alias_attribute :owner, :user

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :short_description, presence: true

end
