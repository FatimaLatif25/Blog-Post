class UserMailer < ApplicationMailer
  default :from => 'admin@gmail.com'

  def new_post_notification(post)
    @post = post
    puts "Sending email to #{@post.user.email}"
    mail(to: @post.user.email, subject: 'Wellcome to the Blog Post')
  end
end
