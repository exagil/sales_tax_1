module SalesTax
  class Calculator
    
    def calculate *product_items
      result = {}
      total_sales_tax = 0
      total_amount = 0
      product_items.each_with_index do |product_item, i|
        sales_tax = (calculate_total_sales_tax_for product_item).
                     ceil_to 2
        product_item_price_with_tax = (product_item.total_price +
                                       sales_tax).round 2
        total_sales_tax += sales_tax
        total_amount += product_item_price_with_tax

        result.store "product_item_#{i+1}", {
          'name' => product_item.name,
          'price_with_tax' => product_item_price_with_tax,
          'quantity' => product_item.quantity
        }
      end
      result.store 'total_sales_tax', total_sales_tax
      result.store 'total_amount', total_amount.round(2)
      result
    end

    private

    def calculate_total_sales_tax_for product_item
      sales_tax_percentage = calculate_sales_tax_percentage_for product_item
      (product_item.price_per_item * sales_tax_percentage/100.00) *
       product_item.quantity
    end

    def calculate_sales_tax_percentage_for product_item
      sales_tax_percentage = 0
      sales_tax_percentage += 10 unless product_item.tax_exempt
      sales_tax_percentage += 5 if product_item.imported
      sales_tax_percentage
    end



  end
end