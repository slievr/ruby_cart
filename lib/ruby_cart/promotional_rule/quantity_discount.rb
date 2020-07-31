require 'money'

module RubyCart
  module PromotionalRule
    class QuantityDiscount
      attr_reader :applies_to

      def initialize(product_code, min_quantiy, sale_price)
        @product_code = product_code
        @min_quantiy = min_quantiy
        @sale_price = sale_price
        @applies_to = :order_products
      end

      def apply(products)
        applicable_item_count = products.count { |product| product.product_code == @product_code }

        return products if applicable_item_count < @min_quantiy

        products.map { |product| (product.product_code == @product_code ? SaleProduct.new(product, @sale_price) : product) }
      end
    end
  end
end
