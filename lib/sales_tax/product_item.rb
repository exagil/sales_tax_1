module SalesTax
  class ProductItem
    def initialize name, price_per_item, quantity, tax_exempt=false, imported=false
      @name = name
      @price_per_item = price_per_item
      @quantity = quantity
      @tax_exempt = tax_exempt
      @imported = imported
    end
  end
end