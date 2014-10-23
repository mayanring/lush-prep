require './lush'

describe Lush do
  context "when calling #find" do
    before do
      @h = Lush::Product.find(302810)
    end

    it "returns a Product" do
      expect(@h.class).to equal(Lush::Product)
    end

  end
end