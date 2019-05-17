class Message < ApplicationRecord
  belongs_to :user
  has_many :reactions
  accepts_nested_attributes_for :reactions

  mount_uploader :image, ImageUploader

  validates :content, presence: true, unless: :image?
end
