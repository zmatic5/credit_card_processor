# frozen_string_literal: true

module Validators
  class CreditCardInputValidator < BaseValidator
    def self.call(name, amount)
      new(name, amount).call
    end

    def initialize(name, amount)
      @name = name
      @amount = amount
    end

    def call
      validate_presence!(name, 'name')
      validate_presence!(amount, 'amount')
      true
    end

    private

    attr_reader :name, :amount
  end
end
