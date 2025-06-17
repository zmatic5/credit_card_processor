# frozen_string_literal: true

module Commands
  class AddCardCommand < BaseCommandService
    def initialize(name, number, limit)
      @name = name
      @number = number
      @limit = limit
    end

    private

    attr_reader :name, :number, :limit

    def validate_input
      Validators::AddCardInputValidator.call(name, number, limit)
    end

    def execute
      return false if AccountStore.instance[name]

      AccountStore.instance[name] = CreditCardAccount.new(
        name: name,
        number: number,
        limit: limit.delete('$').to_i
      )
      true
    end
  end
end
