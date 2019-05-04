class Message < ApplicationRecord
  belongs_to :user
  has_many :reactions

  mount_uploader :image, ImageUploader

  validates :content, presence: true, unless: :image?
end
