# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Validators::CreditCardInputValidator do
  describe '.call' do
    it 'passes with valid name and amount' do
      expect do
        described_class.call('Tom', '$100')
      end.not_to raise_error
    end

    it 'raises when name is missing' do
      expect do
        described_class.call(nil, '$100')
      end.to raise_error(ArgumentError, /Missing name/)
    end

    it 'raises when amount is missing' do
      expect do
        described_class.call('Tom', nil)
      end.to raise_error(ArgumentError, /Missing amount/)
    end
  end
end
