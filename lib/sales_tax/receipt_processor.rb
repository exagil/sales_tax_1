module SalesTax
  class ReceiptProcessor
    def initialize
      @calculator = Calculator.new
    end

    def print_receipt_for *product_items
      calculator_result = @calculator.calculate *product_items
      sales_tax = calculator_result.fetch 'total_sales_tax'
      total_amount = calculator_result.fetch 'total_amount'

      calculator_result.keys.select {|key| key.match /product/ }.
      each do |key|
        product_item_details = calculator_result.fetch key
        quantity = product_item_details.fetch 'quantity'
        name = product_item_details.fetch 'name'
        price_with_tax = product_item_details.fetch 'price_with_tax'
        puts "#{quantity} #{name}: #{price_with_tax}"
      end
      puts "Sales Taxes: #{sales_tax}"
      puts "Total: #{total_amount}"
    end

  end
end