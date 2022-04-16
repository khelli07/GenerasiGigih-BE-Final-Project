require 'rails_helper'
require 'test_helper'

RSpec.describe Category, type: :model do
  describe "validation" do
    it { should validate_presence_of(:name) }
  end
end
