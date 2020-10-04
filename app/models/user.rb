class User < ApplicationRecord
  has_many :pictures, as: :record, dependent: :destroy
  scope :with_attached_pictures, -> { includes(:pictures).merge(Picture.with_attached_attachment) }
end
