require 'sales_tax'

module SalesTax
  RSpec.describe ReceiptProcessor do
    before(:all) do
      @receipt_processor = ReceiptProcessor.new
      @product_item_one = ProductItem.new 'Samsung Galaxy S3',
                                           200.00, 2, false, false
      @product_item_two = ProductItem.new 'MacBook Pro 15',
                                               1000.00, 1, false, false
      @calculator = Calculator.new
    end

    describe '#print_receipt_for' do
      it 'prints the receipt for one product item' do
        calculator_result = {
                              'product_item_1' => { 'name' => 'Samsung Galaxy S3',
                                'price_with_tax' => 440.00,
                                'quantity' => 2
                              },
                              'total_sales_tax' => 40.00,
                              'total_amount' => 440.00
                            }
        receipt_result = "2 Samsung Galaxy S3: 440.0\n" + 
                        "Sales Taxes: 40.0\nTotal: 440.0\n"
        allow(@calculator).to receive(:calculate).with(@product_item_one)
        .and_return calculator_result
        expect { @receipt_processor.print_receipt_for @product_item_one }.
        to output(receipt_result).to_stdout
      end

      it 'prints the receipt for multiple product items' do
        calculator_result = {
                              'product_item_1' => { 'name' => 'Samsung Galaxy S3',
                                'price_with_tax' => 440.00,
                                'quantity' => 2
                              },
                              'product_item_2' => { 'name' => 'MacBook Pro 15',
                                'price_with_tax' => 1100.0,
                                'quantity' => 1
                              },
                              'total_sales_tax' => 140.00,
                              'total_amount' => 1540.00
                            }
        receipt_result = "2 Samsung Galaxy S3: 440.0\n" +
                         "1 MacBook Pro 15: 1100.0\n" +
                         "Sales Taxes: 140.0\nTotal: 1540.0\n"
        allow(@calculator).to receive(:calculate).with(@product_item_one,
                                                       @product_item_two)
        .and_return calculator_result
        expect { @receipt_processor.print_receipt_for @product_item_one,
          @product_item_two }.to output(receipt_result).to_stdout
      end
    end

  end
end