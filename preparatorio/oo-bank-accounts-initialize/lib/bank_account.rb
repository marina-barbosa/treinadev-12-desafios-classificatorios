class BankAccount
    attr_reader :name, :number, :balance

    def initialize(name:, number:, balance: 0)
        @name = name
        @number = number
        @balance = balance
    end
end
