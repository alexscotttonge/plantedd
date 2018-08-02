require 'rails_helper'

RSpec.describe Product, "validations" do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:image_url)}
  it { should validate_uniqueness_of(:name)}
  it { should validate_numericality_of(:price).
        is_greater_than_or_equal_to(1)}
end

RSpec.describe Product, "attachments" do
  it "should reject incorrect file suffixes" do
    ok = ["abies.gif"]
    bad = ["abies.gf"]

    ok.each do |image_url|
      expect(new_product(image_url)).to be_valid
    end

    bad.each do |image_url|
      expect(new_product(image_url)).to be_invalid
    end
  end

  def new_product(image_url)
    Product.new(name: "Abies alba",
                description: "Silver fir",
                price: 100,
                image_url: image_url)
  end
end

RSpec.describe Product, "#save" do
  it "saves a product correctly" do
    product = create :product

    expect(Product.count).to eq 1
  end
end
