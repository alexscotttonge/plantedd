require 'rails_helper'

RSpec.describe Product, "validations" do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:image_url)}
end
