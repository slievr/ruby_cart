require 'ruby_cart/promotional_rules'

RSpec.describe RubyCart::PromotionalRules do
  describe 'promotional rules' do
    before do
      @rules = RubyCart::PromotionalRules.new

      @rule1 = RubyCart::PromotionalRule::QuantityDiscount.new('001', 2, 850)
      @rule2 = RubyCart::PromotionalRule::TotalPercentageDiscount.new(60, 10)

      @prod001 = RubyCart::Product.new('001', 'Lavender heart', 925)
      @prod002 = RubyCart::Product.new('002', 'Personalised cufflinks', 4500)
      @prod003 = RubyCart::Product.new('003', 'Kids T-shirt', 1995)
    end

    context 'total rules' do
      it 'applying no rules, total reamins the same' do
        expect(@rules.apply_total_rules(100)).to eq 100
      end

      it 'applying total rule modifies the total.' do
        @rules.add_rule(@rule2)
        expect(@rules.apply_total_rules(100)).to eq 90
      end
    end
  end
end
