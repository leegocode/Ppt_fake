class User < ApplicationRecord

  validates :account, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_create :encrypt_password
  has_many :comments

  has_many :board_masters
  has_many :posts
  has_many :boards, through: :board_masters
  has_many :favorite_boards
  has_many :favorited_boards, through: :favorite_boards, source: :board


  def self.login(option)
    if option[:account] && option[:password]
      find_by(account: option[:account],
      password: Digest::SHA1.hexdigest('x'+option[:password]+'y'))

      else

      end
    end


    def toggle_favorite_board(b)
       if favorited_boards.exists?(b.id)
         favorited_boards.destroy(b)
       else
         favorited_boards << b
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
