require 'sales_tax'

module SalesTax
  RSpec.describe ReceiptProcessor do
    before(:all) do
      @receipt_processor = ReceiptProcessor.new
      @product_item_one = ProductItem.new 'Samsung Galaxy S3',
                                           200.00, 2, false, false
      @calculator = Calculator.new
      @calculator_result =  {
                              'product_item_1' => { 'name' => 'Samsung Galaxy S3',
                                'price_with_tax' => 440.00,
                                'quantity' => 2
                              },
                              'total_sales_tax' => 40.00,
                              'total_amount' => 440.00
                            }
      @receipt_result = "2 Samsung Galaxy S3: 440.0\n" + 
                        "Sales Taxes: 40.0\nTotal: 440.0\n"
    end

    describe '#print_receipt_for' do
      it 'prints the receipt for product items' do
        allow(@calculator).to receive(:calculate).with(@product_item_one).and_return @calculator_result
        expect { @receipt_processor.print_receipt_for @product_item_one }.
        to output(@receipt_result).to_stdout
      end
    end
  end
end