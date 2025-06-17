# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AccountStore do
  subject(:store) { described_class.instance }

  let(:account) do
    CreditCardAccount.new(
      name: 'Tom',
      number: '4111111111111111',
      limit: 1000
    )
  end

  before { store.all.clear }

  describe '#[] and #[]=' do
    it 'stores and retrieves an account' do
      store['Tom'] = account
      expect(store['Tom']).to eq(account)
    end
  end

  describe '#keys' do
    it 'returns stored account names' do
      store['Tom'] = account
      expect(store.keys).to include('Tom')
    end
  end

  describe '#values' do
    it 'returns stored accounts' do
      store['Tom'] = account
      expect(store.values).to include(account)
    end
  end

  describe '#all' do
    it 'returns the full account hash' do
      store['Tom'] = account
      expect(store.all).to eq({ 'Tom' => account })
    end
  end
end
