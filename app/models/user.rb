class User < ApplicationRecord

  validates :account, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_create :encrypt_psssword


  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest(self.password) 
  end

end
