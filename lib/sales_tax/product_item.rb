module SalesTax
  class ProductItem
    attr_reader :name, :tax_exempt, :imported, :price_per_item, :quantity

    def initialize name, price_per_item, quantity, tax_exempt=false, imported=false
      @name = name
      @price_per_item = price_per_item
      @quantity = quantity
      @tax_exempt = tax_exempt
      @imported = imported
    end

    def total_price
      @price_per_item * @quantity
    end
  end
end