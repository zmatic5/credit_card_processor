# frozen_string_literal: true

module Validators
  class UniqueCardValidator < BaseValidator
    def self.call(name, number)
      new(name, number).call
    end

    def initialize(name, number)
      @name = name
      @number = number
    end

    def call
      raise ArgumentError, "Account already exists for name '#{name}'" if store[name]

      if store.values.any? { |acc| acc.number == number }
        raise ArgumentError, "Credit card number '#{number}' already taken"
      end

      true
    end

    private

    attr_reader :name, :number

    def store
      AccountStore.instance
    end
  end
end
