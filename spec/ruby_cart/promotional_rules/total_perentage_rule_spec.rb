require 'ruby_cart/promotional_rules'

RSpec.describe RubyCart::PromotionalRule::TotalPercentageDiscount do
  describe 'total percentage discount' do
    it 'applying rule reduces total by 10%' do
      total = 100
      rule = RubyCart::PromotionalRule::TotalPercentageDiscount.new(60, 10)
      expect(rule.apply(total)).to eq(total * 0.9)
    end

    it 'applying rule reduces total by 50%' do
      total = 100
      rule = RubyCart::PromotionalRule::TotalPercentageDiscount.new(60, 50)
      expect(rule.apply(total)).to eq(total * 0.5)
    end

    it 'applying rule respects deciamls' do
      total = 1
      rule = RubyCart::PromotionalRule::TotalPercentageDiscount.new(1, 10)
      expect(rule.apply(total)).to eq(0.9)
    end
  end
end
