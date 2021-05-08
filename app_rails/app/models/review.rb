# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User'
  belongs_to :reviewed, class_name: 'User'
  validates :puntaje, presence: true
  validates :titulo, presence: true
  validates :cuerpo, presence: true
  validates :reviewed_id, presence: true
end
