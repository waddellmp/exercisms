module SavingsAccount
  def self.interest_rate(balance)
    result = 0
    case(balance)
      when 0...1000
        result = 0.5
      when 1000...5000
        result = 1.621
      when 5000..Float::INFINITY
        result = 2.475
    else
        result = 3.213
    end
  end

  def self.annual_balance_update(balance)
    new_balance = balance + (balance * (self.interest_rate(balance) / 100))
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    running_balance = current_balance
    
    return years if current_balance >= desired_balance 

    while running_balance < desired_balance
      years += 1
      running_balance = self.annual_balance_update(running_balance)
    end

    years
  end
end
