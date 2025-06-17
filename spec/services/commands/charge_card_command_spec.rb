# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Commands::ChargeCardCommand do
  let(:store) { AccountStore.instance }

  before do
    store.all.clear
    store['Tom'] = CreditCardAccount.new(name: 'Tom', number: '4111111111111111', limit: 1000)
  end

  it 'charges if within limit' do
    result = described_class.call('Tom', '$500')
    expect(result).to be true
    expect(store['Tom'].balance).to eq(500)
  end

  it 'fails if above limit' do
    described_class.call('Tom', '$1000')
    result = described_class.call('Tom', '$100')

    expect(result).to be false
    expect(store['Tom'].balance).to eq(1000)
  end
end
