# frozen_string_literal: true

module Commands
  class CreditCardCommand < BaseCommandService
    def initialize(name, amount)
      @name = name
      @amount = amount
    end

    private

    attr_reader :name, :amount

    def validate_input
      Validators::CreditCardInputValidator.call(name, amount)
    end

    def execute
      account = AccountStore.instance[name]
      return false unless account&.valid?

      account.credit(amount.delete('$').to_i)
      true
    end
  end
end
