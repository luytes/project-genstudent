class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :send_welcome_email

  mount_uploader :profile_picture, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :services, through: :students
  has_many :surveys

  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company_name, presence: true
  validates :company_description, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
