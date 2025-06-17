# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Validators::LuhnValidator do
  describe '.call' do
    it 'returns true for valid card number' do
      expect(described_class.call('4111111111111111')).to be true
    end

    it 'returns false for invalid card number' do
      expect(described_class.call('1234567890123456')).to be false
    end
  end
end
