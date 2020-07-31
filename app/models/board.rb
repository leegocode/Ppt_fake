class Board < ApplicationRecord

acts_as_paranoid

has_many :posts, dependent: :destroy

validates :title, presence: true, length: { minimum: 2 }
end
