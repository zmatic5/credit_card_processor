class CreditCardAccount
  attr_reader :name, :number, :limit, :balance

  def initialize(name:, number:, limit:)
    @name = name
    @number = number
    @limit = limit
    @balance = 0
  end

  def valid?
    Validators::LuhnValidator.call(number)
  end

  def charge(amount)
    return unless valid?
    @balance += amount if @balance + amount <= limit
  end

  def credit(amount)
    return unless valid?
    @balance -= amount
  end
end
