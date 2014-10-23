require 'httparty'
require 'awesome_print'

module Lush
  class Product
    attr_accessor :response

    include HTTParty
    base_uri 'lcboapi.com'

    def initialize(response)
      @response = response
    end

    def self.find(id)
      response = get("/products/#{id}")
      Product.new(response)
    end

    def method_missing(name, *args, &block)
      if @response["result"].has_key?(name.to_s)
        @response["result"][name.to_s]
      else
        super
      end
    end


  end
end


# product = Lush::Product.find(302810)
# ap product['name']
# ap product.serving_suggestion