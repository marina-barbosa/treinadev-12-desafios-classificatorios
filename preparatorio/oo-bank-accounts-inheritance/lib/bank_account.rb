class BankAccount
  attr_reader :name, :number
  attr_accessor :balance

  def initialize(name:, number:, balance: 0)
    @name = name
    @number = number
    @balance = balance
  end
  
  def deposit(value)
    @balance += value
  end

  def debit(value)
    return "Saldo insuficiente." if (@balance - value) < 0

    @balance -= value
  end
end
