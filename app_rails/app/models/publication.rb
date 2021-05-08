# frozen_string_literal: true

class Publication < ApplicationRecord
  enum types: { adoption: 0, sale: 1 }
  belongs_to :user
  has_many :user_requests, dependent: :destroy
end
