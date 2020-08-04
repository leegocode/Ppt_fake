class Board < ApplicationRecord

acts_as_paranoid

has_many :board_masters
has_many :users, through: :board_masters

has_many :posts, dependent: :destroy


validates :title, presence: true, length: { minimum: 2 }

end
