module CoreExtensions
  module Float
    module Round

      def ceil_to value
        (self * 10**value).ceil / (10**value).to_f
      end

    end
  end
end