class Post < ApplicationRecord
  belongs_to :board
  belongs_to :user
  validates :title, presence: true
  validates :serial, uniqueness: true

  before_create  :create_serial
  # before_create :generate_permalink

  # def to_param
  #    self.permalink
  #  end

  def display_username
    if user.nil?
       "未知"
     else
       user.account
     end
  end


  private

  def create_serial
    self.serial = serial_generator(10)
  end

  def serial_generator(n)
    a = [*'a'..'z',*'A'..'Z',*0..9].sample(n).join
  end

  def generate_permalink
     self.permalink = SecureRandom.hex(8)
   end

end
