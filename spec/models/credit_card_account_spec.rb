# frozen_string_literal: true

require 'spec_helper'
require 'models/credit_card_account'

RSpec.describe CreditCardAccount do
  let(:card) { described_class.new(name: 'Tom', number: '4111111111111111', limit: 1000) }

  it 'starts with zero balance' do
    expect(card.balance).to eq 0
  end

  it 'recognizes valid card numbers' do
    expect(card.valid?).to be true
  end

  it 'rejects invalid card numbers' do
    invalid = described_class.new(name: 'Q', number: '1234567890123456', limit: 500)
    expect(invalid.valid?).to be false
  end

  it 'charges amount if within limit' do
    card.charge(500)
    expect(card.balance).to eq 500
  end

  it 'does not charge if over limit' do
    card.charge(1100)
    expect(card.balance).to eq 0
  end

  it 'credits even if it goes negative' do
    card.credit(200)
    expect(card.balance).to eq(-200)
  end
end
