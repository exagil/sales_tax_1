module SalesTax
  class ItemInputParser
    TAX_EXEMPT_KEYWORDS = ['book', 'chocolate', 'pills']

    def parse input
      item_details = input.match(/(\d+)\s+([a-zA-Z\s]+)at\s+(\d+.\d+)/)
      name = item_details[2].chop
      quantity = item_details[1].to_i
      price = item_details[3].to_f
      tax_exempt = is_tax_exempt? name
      imported = name.include? 'imported'
      [name, price, quantity, tax_exempt, imported]
    end

    private

    def is_tax_exempt? name
      TAX_EXEMPT_KEYWORDS.each do |tax_exempt_keyword|
        return true if name.include? tax_exempt_keyword
      end
      false
    end

  end
end