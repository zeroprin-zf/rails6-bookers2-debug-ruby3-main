class Room < ApplicationRecord
  belongs_to :user #余分かも
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy
end
