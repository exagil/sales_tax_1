module SalesTax
  class ProductItem
    def initialize name, price_per_item, quantity
      @name = name
      @price_per_item = price_per_item
      @quantity = quantity
      @exempt = false
      @imported = false
    end
  end
end