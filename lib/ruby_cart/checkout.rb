module RubyCart
  class Checkout
    def initialize(promotional_rules)
      @promotional_rules = promotional_rules
      @products = []
    end

    def scan(product)
      products.add(product)
    end

    def quantity
      products.size
    end
  end
end
