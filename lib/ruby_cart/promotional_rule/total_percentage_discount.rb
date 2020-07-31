module RubyCart
  module PromotionalRule
    class TotalPercentageDiscount
      attr_reader :applies_to

      def initialize(min_spend, percent)
        @applies_to = :order_total
        @min_spend = min_spend
        @percentage_discount = percent
      end

      def apply(total)
        if total >= @min_spend
          (((100 - @percentage_discount) * total.to_f) / 100)
        else
          total
        end
      end
    end
  end
end
