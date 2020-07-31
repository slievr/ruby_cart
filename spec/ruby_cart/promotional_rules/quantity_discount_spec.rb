require 'ruby_cart/promotional_rules'

RSpec.describe RubyCart::PromotionalRule::QuantityDiscount do
  before do
    @prod001 = RubyCart::Product.new('001', 'Lavender heart', 925)
    @prod002 = RubyCart::Product.new('002', 'Personalised cufflinks', 4500)
    @prod003 = RubyCart::Product.new('003', 'Kids T-shirt', 1995)

    @products = [@prod001, @prod001, @prod002, @prod001]
  end

  it 'product quantity discount does not apply when threshold reached' do
    total = @products.inject(0) { |sum, product| sum + product.price }
    expect(total).to eq(7275)

    rule = RubyCart::PromotionalRule::QuantityDiscount.new('001', 4, 850)
    products_after_rule = rule.apply(@products)
    new_total = products_after_rule.inject(0) { |sum, product| sum + product.price }
    expect(total).to eq(7275)
  end

  it 'product quantity discount applies when threshold reached' do
    total = @products.inject(0) { |sum, product| sum + product.price }
    expect(total).to eq(7275)

    rule = RubyCart::PromotionalRule::QuantityDiscount.new('001', 2, 850)
    products_after_rule = rule.apply(@products)

    new_total = products_after_rule.inject(0) { |sum, product| sum + product.price }
    expect(new_total).to eq(7050)
  end
end
