# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'is not valid without a puntaje' do
    review = described_class.new(puntaje: nil)
    expect(review).not_to be_valid
  end

  it 'is not valid without a titulo' do
    review = described_class.new(titulo: nil)
    expect(review).not_to be_valid
  end

  it 'is not valid without a cuerpo' do
    review = described_class.new(cuerpo: nil)
    expect(review).not_to be_valid
  end

  it 'is not valid without a reviewed_id' do
    review = described_class.new(reviewed_id: nil)
    expect(review).not_to be_valid
  end

  it 'is not valid without a reviewer_id' do
    review = described_class.new(reviewer_id: nil)
    expect(review).not_to be_valid
  end
end
