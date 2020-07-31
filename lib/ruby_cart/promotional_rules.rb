module RubyCart
  class PromotionalRules
    def initialize
      @total_rules = []
      @product_rules = []
    end

    def add_rule(rule)
      @total_rules.push(rule) if rule.applies_to == :order_total
      @product_rules.push(rule) if rule.applies_to == :order_products
    end

    def apply_total_rules(total)
      return total if @total_rules.empty?

      @total_rules.inject(total) { |subtotal, rule| rule.apply(subtotal) }
    end

    def apply_product_rules(products)
      return products if @product_rules.empty?

      @product_rules.inject(products) { |prod_list, rule| rule.apply(prod_list) }
    end
  end
end
