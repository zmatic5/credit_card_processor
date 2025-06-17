# frozen_string_literal: true

module Validators
  class LuhnValidator < BaseValidator
    def self.call(number)
      new(number).call
    end

    def initialize(number)
      @number = number
    end

    def call
      digits = number.chars.map(&:to_i)
      checksum = digits.reverse.each_with_index.sum do |digit, i|
        i.odd? ? (digit * 2).divmod(10).sum : digit
      end
      (checksum % 10).zero?
    end

    private

    attr_reader :number
  end
end
