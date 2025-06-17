# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Commands::AddCardCommand do
  let(:store) { AccountStore.instance }

  before { store.all.clear }

  it 'adds a valid card' do
    result = described_class.call('Tom', '4111111111111111', '$1000')

    expect(result).to be true
    expect(store['Tom']).not_to be_nil
  end

  it 'fails if card number is already taken' do
    store['Existing'] = CreditCardAccount.new(name: 'Existing', number: '4111111111111111', limit: 1000)

    expect do
      described_class.call('Tom', '4111111111111111', '$1000')
    end.to raise_error(ArgumentError, /already taken/)
  end
end
