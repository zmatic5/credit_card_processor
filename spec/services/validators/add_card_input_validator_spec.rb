# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Validators::AddCardInputValidator do
  describe '.call' do
    it 'passes with valid input' do
      expect do
        described_class.call('Tom', '4111111111111111', '$1000')
      end.not_to raise_error
    end

    it 'raises for missing name' do
      expect do
        described_class.call(nil, '4111', '$1000')
      end.to raise_error(ArgumentError, /Missing name/)
    end

    it 'raises for missing number' do
      expect do
        described_class.call('Tom', '', '$1000')
      end.to raise_error(ArgumentError, /Missing number/)
    end

    it 'raises for missing limit' do
      expect do
        described_class.call('Tom', '4111', nil)
      end.to raise_error(ArgumentError, /Missing limit/)
    end
  end
end
