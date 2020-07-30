require 'ruby_cart/checkout'

RSpec.describe Checkout do
  it 'test' do
    expect(subject.nil?).to eq false
  end

  it 'New basket has no value' do
    expect(subject.total).to eq '£0.00'
  end

  it 'Basket: 001,002,003' do
    co = Checkout.new(promotional_rules)
    co.scan(item)
    co.scan(item)

    expect(co.total).to eq '£66.78'
  end

  it 'Basket: 001,003,001' do
    co = Checkout.new(promotional_rules)
    co.scan(item)
    co.scan(item)

    expect(co.total).to eq '£36.95'
  end

  it 'Basket: 001,002,001,003' do
    co = Checkout.new(promotional_rules)
    co.scan(item)
    co.scan(item)

    expect(co.total).to eq '£73.76'
  end
end
