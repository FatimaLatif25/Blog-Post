class EmailNotificationJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find(post_id)
    UserMailer.new_post_notification(post).deliver_later
  end
end
