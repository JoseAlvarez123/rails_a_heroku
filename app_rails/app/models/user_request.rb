# frozen_string_literal: true

class UserRequest < ApplicationRecord
  belongs_to :user
  belongs_to :publication
  enum status: { pending: 0, rejected: 1, accepted: 2 }

  def change_status(value)
    self.status = value
  end
end
