class Post < ApplicationRecord
  has_one_attached :image
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :category
  validates :title, :content, presence: true
  after_create :save_data_notification
  after_create :send_email_notification
  validates :title, :content, presence: true

 
  private

  def save_data_notification
    puts 'Your Post Data saved successfully'
  end

  def send_email_notification
    EmailNotificationJob.perform_later(self.id)
  end

end
