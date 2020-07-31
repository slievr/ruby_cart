RSpec.describe RubyCart::Checkout do
    before do
      @rules = RubyCart::PromotionalRules.new

      @co = RubyCart::Checkout.new(@rules)

      @rule1 = RubyCart::PromotionalRule::QuantityDiscount.new('001', 2, 850)
      @rule2 = RubyCart::PromotionalRule::TotalPercentageDiscount.new(60, 10)

      @prod001 = RubyCart::Product.new('001', 'Lavender heart', 925)
      @prod002 = RubyCart::Product.new('002', 'Personalised cufflinks', 4500)
      @prod003 = RubyCart::Product.new('003', 'Kids T-shirt', 1995)
    end

    it 'scaning items changes the basket_size.' do
      @co.scan(@prod001)

      expect(@co.basket_size).to eq 1
    end

    it 'total calculates correctly with no rules applied.' do
      @co.scan(@prod001)

      expect(@co.total).to eq Money.new(925)
    end

    it 'total calculates correctly when multiple items added.' do
      @co.scan(@prod001)
      @co.scan(@prod001)

      expect(@co.total).to eq Money.new(1850)
    end

    it 'applying product discounts modifies the total.' do
      @co.scan(@prod001)
      @co.scan(@prod001)

      expect(@co.total).to eq Money.new(1850)

      @rules.add_rule(@rule1)

      expect(@co.total).not_to eq Money.new(1850)
    end
end
