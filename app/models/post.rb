class Post < ApplicationRecord
  belongs_to :board
  validates :title, presence: true
  validates :serial, uniqueness: true
  before_save :create_serial


  private
  def create_serial
    self.serial= serial_gernerator(10)
  end
  def serial_generator(n)
    a = [*'a'..'z',*'A'..'Z',*0..9]sample(n).join
  end
end
