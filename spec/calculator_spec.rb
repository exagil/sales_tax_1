require 'sales_tax'

module SalesTax
  RSpec.describe Calculator do
    
    before(:all) do
      @calculator = Calculator.new
    end

    describe '#calculate' do
      context 'with non tax exempt non imported items only' do
        before(:all) do
          @product_item_one = ProductItem.new 'Samsung Galaxy S3',
                                               200.00, 2, false, false
          @product_item_two = ProductItem.new 'MacBook Pro 15',
                                               1000.00, 1, false, false
          @expected_result =  {
                                'product_item_1' => { 'name' => 'Samsung Galaxy S3',
                                  'price_with_tax' => 440.00,
                                  'quantity' => 2
                                },
                                'product_item_2' => { 'name' => 'MacBook Pro 15',
                                  'price_with_tax' => 1100.00,
                                  'quantity' => 1
                                },
                                'total_sales_tax' => 140.00,
                                'total_amount' => 1540.00
                              }
        end

        it 'returns a hash containing sales tax applied for all items' do
          result = @calculator.calculate @product_item_one,
                                         @product_item_two
          expect(result).to eq @expected_result
        end
      end
    end

  end
end