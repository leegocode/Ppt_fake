class SendmailJob < ApplicationJob
  queue_as :default

  def perform(post)
    puts "---------------------------"
    puts "寄信"
    puts "---------------------------"
    # Do something later
     PostMailer.with(post: post).poster.deliver_now
  end
end
