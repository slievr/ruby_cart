require 'ruby_cart/version'
require 'money'

module RubyCart
  class Error < StandardError; end

  Money.default_currency = Money::Currency.new('GBP')
  # Your code goes here...
end
