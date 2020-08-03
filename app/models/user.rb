class User < ApplicationRecord

  validates :account, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_create :encrypt_password

   def self.login(option)
     if option[:account] && option[:password]
        find_by(account: option[:account],
         password: Digest::SHA1.hexdigest('x'+option[:password]+'y'))
     else
       return false
     end
   end
   
   # User.login

   private
   def encrypt_password
     self.password = bigbang(self.password)
   end

   def bigbang(string)
     string = "x" + string + "y"
     Digest::SHA1.hexdigest(string)
   end
 end