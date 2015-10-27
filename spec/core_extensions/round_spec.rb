module CoreExtensions
  module Float
    RSpec.describe Round do

      describe '#ceil_to' do
        it 'returns the float ceiled to the given value' do
          a = 1.234
          b = 16.48712
          c = 123.4567
          expect(a.ceil_to 2).to eq 1.24
          expect(b.ceil_to 3).to eq 16.488
          expect(c.ceil_to 2).to eq 123.46
        end
      end

    end
  end
end