#-------Written by Essaahijazi and wley3337------

require "pry"
require_relative "./bank_account.rb"

class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver
  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? == true && self.receiver.valid? == true
  end

  def execute_transaction
    if self.sender.valid? && (self.sender.balance - self.amount) > 0 && self.status != "complete"
          self.receiver.balance += self.amount
          self.sender.balance -= self.amount
          self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    end
  end


end