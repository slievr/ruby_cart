require 'ruby_cart/product'
require 'money'

module RubyCart
  class SaleProduct
    attr_reader :name
    attr_reader :product_code
    attr_reader :price
    attr_reader :sale_price

    def initialize(product, sale_price)
      @product_code = product.product_code
      @name = product.name
      @price = sale_price
      @normal_price = product.price
    end
  end
end
