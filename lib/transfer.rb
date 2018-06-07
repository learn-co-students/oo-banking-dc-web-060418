#-------Written by Essaahijazi and wley3337------

require "pry"
require_relative "./bank_account.rb"

# Transfer
#    initialize
#      can initialize a Transfer (FAILED - 9)
#      initializes with a sender (FAILED - 10)
#      initializes with a receiver (FAILED - 11)
#      always initializes with a status of 'pending' (FAILED - 12)
#      initializes with a transfer amount (FAILED - 13)
#    #valid?
#      can check that both accounts are valid (FAILED - 14)
#      calls on the sender and reciever's #valid? methods (FAILED - 15)
#    #execute_transaction
#      can execute a successful transaction between two accounts (FAILED - 16)
#      each transfer can only happen once (FAILED - 17)
#      rejects a transfer if the sender doesn't have a valid account (FAILED - 18)
#    #reverse_transfer
#      can reverse a transfer between two accounts (FAILED - 19)
#      it can only reverse executed transfers (FAILED - 20)

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
