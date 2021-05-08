# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_requests, dependent: :destroy
  has_many :publications, dependent: :destroy
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy,
                           inverse_of: 'sender'
  has_many :recieved_messages, class_name: 'Message', foreign_key: 'reciever_id',
                               dependent: :destroy, inverse_of: 'reciever'
  has_many :recieved_reviews, class_name: 'Review', foreign_key: 'reviewed_id',
                              dependent: :destroy, inverse_of: 'reviewed'
  has_many :sent_reviews, class_name: 'Review', foreign_key: 'reviewer_id', dependent: :destroy,
                          inverse_of: 'reviewer'
  has_many :comments, dependent: :destroy

  def full_name
    "#{name} #{last_name}"
  end

  def chat(user_id)
    Message.where(sender_id: id,
                  reciever_id: user_id).or(Message.where(sender_id: user_id,
                                                         reciever_id: id)).order(:created_at)
  end
end
