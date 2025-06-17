# frozen_string_literal: true

module Validators
  class AddCardInputValidator < BaseValidator
    def self.call(name, number, limit)
      new(name, number, limit).call
    end

    def initialize(name, number, limit)
      @name = name
      @number = number
      @limit = limit
    end

    def call
      validate_presence!(name, 'name')
      validate_presence!(number, 'number')
      validate_presence!(limit, 'limit')

      Validators::UniqueCardValidator.call(name, number)
      true
    end

    private

    attr_reader :name, :number, :limit
  end
end
