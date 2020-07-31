require 'money'
module RubyCart
  class Checkout
    def initialize(promotional_rules)
      @promotional_rules = promotional_rules
      @products = []
    end

    def scan(product)
      @products.push(product)
    end

    def basket_size
      @products.size
    end

    def total
      return Money.new(0) if @products.empty?

      @products = @promotional_rules.apply_product_rules(@products) if @promotional_rules

      total = @products.inject(0) { |sum, product| sum + product.price }

      return Money.new(total) unless @promotional_rules

      Money.new(@promotional_rules.apply_total_rules(total))
    end
  end
end
