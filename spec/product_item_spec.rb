require 'sales_tax'

module SalesTax
  RSpec.describe ProductItem do
    describe '#new' do
      context 'with valid params' do
        it 'creates a new non tax exempt non imported ProductItem' do
          p = ProductItem.new('book', 12.00, 2)
          expect(p.name).to eq "book"
          expect(p.price_per_item).to eq 12.00
          expect(p.quantity).to eq 2
          expect(p.tax_exempt).to eq false
          expect(p.imported).to eq false
        end

        it 'creates a new tax exempt non imported ProductItem if explicitly specified' do
          p = ProductItem.new('book', 12.00, 2, true)
          expect(p.tax_exempt).to eq true
          expect(p.imported).to eq false
        end

        it 'creates a new imported ProductItem if explicitly specified' do
          p = ProductItem.new('book', 12.00, 2, true, true)
          expect(p.imported).to eq true
        end
      end
    end

    describe '#total_price' do
      it 'returns the product of price and quantity' do
        p = ProductItem.new('book', 12.00, 2)
        expect(p.total_price).to eq(24.00)
      end
    end

  end
end