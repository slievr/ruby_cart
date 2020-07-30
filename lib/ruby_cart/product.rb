class Product
  attr_accessor :name
  attr_accessor :product_code
  attr_accessor :price

  def initialize(product_code = '', name = '', price = 0)
    @product_code = product_code
    @name = name
    @price = price
  end
end
