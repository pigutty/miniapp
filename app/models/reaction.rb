class Reaction < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates :stamp_type
end
