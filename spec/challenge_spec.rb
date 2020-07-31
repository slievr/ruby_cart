RSpec.describe RubyCart do
  describe 'challenge' do
    context 'checkout' do
      before do
        promotions = RubyCart::PromotionalRules.new

        promotions.add_rule(RubyCart::PromotionalRule::QuantityDiscount.new('001', 2, 850))
        promotions.add_rule(RubyCart::PromotionalRule::TotalPercentageDiscount.new(6000, 10))

        @co = RubyCart::Checkout.new(promotions)
        @prod001 = RubyCart::Product.new('001', 'Lavender heart', 925)
        @prod002 = RubyCart::Product.new('002', 'Personalised cufflinks', 4500)
        @prod003 = RubyCart::Product.new('003', 'Kids T-shirt', 1995)
      end

      it 'New basket has no value' do
        expect(@co.basket_size).to eq(0)
        expect(@co.total).to eq Money.new(0)
      end

      it 'Basket: 001,002,003 Total: £66.78' do
        @co.scan(@prod001)
        @co.scan(@prod002)
        @co.scan(@prod003)

        expect(@co.basket_size).to eq(3)
        expect(@co.total).to eq(Money.new(6678))
      end

      it 'Basket: 001,003,001 Total: £36.95' do
        @co.scan(@prod001)
        @co.scan(@prod003)
        @co.scan(@prod001)

        expect(@co.basket_size).to eq(3)
        expect(@co.total).to eq(Money.new(3695))
      end

      it 'Basket: 001,002,001,003 Total: £73.76' do
        @co.scan(@prod001)
        @co.scan(@prod002)
        @co.scan(@prod001)
        @co.scan(@prod003)

        expect(@co.basket_size).to eq(4)
        expect(@co.total).to eq(Money.new(7376))
      end
    end
  end
end
