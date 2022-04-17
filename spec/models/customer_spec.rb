require 'rails_helper'
require 'test_helper'

RSpec.describe Customer, type: :model do
  describe "validation" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }  
    it { should allow_value("savira@gigih.com").for(:email) }
    it { should_not allow_value("halo@gigih").for(:email) }
  end
end
