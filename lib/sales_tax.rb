require_relative 'sales_tax/cli'
require_relative 'sales_tax/product_item'
require_relative 'sales_tax/calculator'
require_relative 'sales_tax/item_input_parser'
require_relative 'sales_tax/receipt_processor'
require_relative 'sales_tax/core_extensions/round'

module SalesTax
  Float.include CoreExtensions::Float::Round
end