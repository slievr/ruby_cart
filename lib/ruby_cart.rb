require 'ruby_cart/version'
require 'money'
require 'ruby_cart/sale_product'
require 'ruby_cart/promotional_rules'
require 'ruby_cart/product'
require 'ruby_cart/checkout'
require 'ruby_cart/promotional_rule/quantity_discount'
require 'ruby_cart/promotional_rule/total_percentage_discount'

module RubyCart
  class Error < StandardError; end

  Money.default_currency = Money::Currency.new('GBP')
  Money.rounding_mode = BigDecimal::ROUND_HALF_UP
end
