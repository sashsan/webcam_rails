class Player < ApplicationRecord
  attribute :player_picture, :string, default: ''

  validates :name, presence: true, uniqueness: true
  validates_length_of :name, minimum: 5

  has_one_attached :picture

  def has_picture?
    File.exist?(ActiveStorage::Blob.service.path_for(picture.key))
  end
end
