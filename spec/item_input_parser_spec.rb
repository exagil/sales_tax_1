require 'sales_tax'

module SalesTax
  RSpec.describe ItemInputParser do
    before(:all) { @item_input_processor = ItemInputParser.new }

    describe '#parse' do
      context 'for non taxable non imported products' do
        it 'sets tax_exempt to true and imported to be false' do
          input = '1 book at 12.49'
          expect(@item_input_processor.parse input)
          .to eq(['book', 12.49, 1, true, false])
        end
      end
    end

  end
end