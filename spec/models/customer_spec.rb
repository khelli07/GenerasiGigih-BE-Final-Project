require 'rails_helper'
require 'test_helper'

RSpec.describe Customer, type: :model do
  describe "validation" do
    it { should validate_presence_of(:email) }
  end
end
