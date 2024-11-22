class CommentsChannel < ApplicationCable::Channel
  def subscribed
    post = Post.find(params[:post_id])
    stream_from post
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
