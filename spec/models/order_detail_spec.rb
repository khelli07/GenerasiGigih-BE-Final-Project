require 'rails_helper'
require 'test_helper'

RSpec.describe OrderDetail, type: :model do
  describe "associations" do
    it { should belong_to(:order) }
  end
  
  describe "validation" do
    it { should validate_presence_of(:order_id) }
  end
end
