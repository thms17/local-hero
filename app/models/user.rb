class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :tasks
  has_many :questions
  has_many :events
  has_many :comments
  has_many :notifications, foreign_key: :recipient_id

  has_many :attendances
  has_many :attended_events, -> { where(type: "Event") }, through: :attendances, source: :post
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def upvote!
    update(votes: votes + 1)
  end
end
