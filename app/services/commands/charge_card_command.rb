# frozen_string_literal: true

module Commands
  class ChargeCardCommand < BaseCommandService
    def initialize(name, amount)
      @name = name
      @amount = amount
    end

    private

    attr_reader :name, :amount

    def validate_input
      Validators::ChargeCardInputValidator.call(name, amount)
    end

    def execute
      account = AccountStore.instance[name]
      return false unless account&.valid?

      amt = amount.delete('$').to_i
      return false if account.balance + amt > account.limit

      account.charge(amt)
      true
    end
  end
end
