class PostMailer < ApplicationMailer
  def poster #在這裡mail定義的方法都會變成類別方法
    @post = params[:post]
    mail to: @post.user.email,
    subject: "add new post #{@post.title}"
  end
end
