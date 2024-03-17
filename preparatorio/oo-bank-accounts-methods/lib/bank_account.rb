class BankAccount
  attr_reader :name, :number
  attr_accessor :balance

  def initialize(name:, number:, balance: 0)
    @name = name
    @number = number
    @balance = balance
  end

  def deposit(valor)
    self.balance += valor
  end

  def debit(valor)
    if valor > self.balance
      return 'Saldo insuficiente.'
    end
    self.balance -= valor
  end

  
end
