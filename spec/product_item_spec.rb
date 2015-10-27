require 'sales_tax'

module SalesTax
  RSpec.describe ProductItem do
    describe '#new' do
      context 'with valid params' do
        it 'creates a new non exempt non imported ProductItem' do
          p = ProductItem.new('book', 12.00, 2)
          expect(p.instance_eval "@name").to eq "book"
          expect(p.instance_eval "@price_per_item").to eq 12.00
          expect(p.instance_eval "@quantity").to eq 2
          expect(p.instance_eval "@exempt").to eq false
          expect(p.instance_eval "@imported").to eq false
        end
      end
    end
  end
end