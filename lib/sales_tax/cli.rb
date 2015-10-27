module SalesTax
  class Cli
    
    def start
      product_items = []
      item_input_parser = ItemInputParser.new
      while true
        print "\nEnter Product Details: "
        entered_product_details = gets.chomp
        extracted_product_details = item_input_parser.parse entered_product_details
        product_items << (ProductItem.new *extracted_product_details)
        print "\n1. Enter Another Product"
        print "\n2. Calculate"
        print "\n3. Exit"
        print "\nChoose: "
        choice = gets.chomp.to_i

        case choice
        when 1
        when 2
          receipt_processor = ReceiptProcessor.new
          receipt_processor.print_receipt_for *product_items
          product_items = []
        when 3
          exit(0)
        else
          puts "Wrong Choice"
        end

      end
    end

  end
end