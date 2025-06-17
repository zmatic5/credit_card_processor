# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Commands::CreditCardCommand do
  let(:store) { AccountStore.instance }

  before do
    store.all.clear
    store['Lisa'] = CreditCardAccount.new(name: 'Lisa', number: '5454545454545454', limit: 3000)
    store['Lisa'].charge(100)
  end

  it 'credits account and reduces balance' do
    result = described_class.call('Lisa', '$30')
    expect(result).to be true
    expect(store['Lisa'].balance).to eq(70)
  end
end
