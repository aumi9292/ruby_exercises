require_relative 'cash_register'
require_relative 'transaction'

require 'minitest/autorun'
require 'minitest/reporters'
p MiniTest::Reporters.use!

class CashRegisterTest < MiniTest::Test
  attr_accessor :register, :transaction1
  attr_reader :wrong_transaction_types

  def setup
    @register = CashRegister.new(100)
    @transaction1 = Transaction.new(10)
    @wrong_transaction_types = [10, 'hello']
  end

  def test_accept_money_modifies_total_money
    transaction1.amount_paid = 10
    register.accept_money(transaction1)
    assert_equal(110, register.total_money)
  end

  def test_accept_money_only_accepts_transactions
    assert_raises(NoMethodError) do
      wrong_transaction_types.each { |type| register.accept_money(type) }
    end
  end

  def test_change
    transaction1.amount_paid = 10
    assert_equal(0, register.change(transaction1))
    transaction1.amount_paid = 20
    assert_equal(10, register.change(transaction1))
  end

  def test_receipt
    transaction1.amount_paid = 10
    assert_output("You've paid $#{transaction1.item_cost}.\n") { register.give_receipt(transaction1) }
  end
end

class TransactionTest < MiniTest::Test
  attr_accessor :register, :transaction1

  def setup
    @register = register
    @transaction1 = Transaction.new(10)
  end

  def test_prompt_for_payment
    input = StringIO.new("10\n")
    output = StringIO.new
    assert_output("You owe $10.\nHow much are you paying?\n") { transaction1.prompt_for_payment(input: input) }
    assert_equal(10, transaction1.amount_paid)
  end

  # def test_prompt_for_payment_insufficient
  #   input = StringIO.new("1\n")
  #   assert_output('That is not the correct amount. ' \
  #   'Please make sure to pay the full cost.') { transaction1.prompt_for_payment(input: input) }
  # end
end
