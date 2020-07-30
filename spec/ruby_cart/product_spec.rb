require 'ruby_cart/product'

RSpec.describe Product do
  it 'test' do
    product = Product.new
    product.name = 'test'
    expect(product.name).to eq 'test'
  end
end
