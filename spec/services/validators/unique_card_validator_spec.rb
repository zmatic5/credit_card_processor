# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Validators::UniqueCardValidator do
  let(:store) { AccountStore.instance }

  before { store.all.clear }

  it 'passes if name and number are unique' do
    expect do
      described_class.call('Tom', '4111111111111111')
    end.not_to raise_error
  end

  it 'raises if account name already exists' do
    store['Tom'] = double('CreditCardAccount', number: '4111111111111111')

    expect do
      described_class.call('Tom', '4111111111111111')
    end.to raise_error(ArgumentError, /Account already exists for name 'Tom'/)
  end

  it 'raises if card number already exists for another account' do
    store['Lisa'] = double('CreditCardAccount', number: '5454545454545454')

    expect do
      described_class.call('Tom', '5454545454545454')
    end.to raise_error(ArgumentError, /Credit card number '5454545454545454' already taken/)
  end
end
