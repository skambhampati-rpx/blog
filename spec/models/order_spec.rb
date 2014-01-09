require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
  
  #Associations
  it{should belong_to(:user)}
  it {should validate_numericality_of(:price).is_greater_than(0)}
  it "discount should not be greater than actual zprice" do
    order = FactoryGirl.build(:order, :price => 300, :discount => 400 )
    order.valid?
    #order.errors[:base].should include("Price should be greater than discount")
    expect(order.errors[:base]).to include("Price should be greater than discount")
  end
  
  context "#generate_discount" do
    it "generates no discount if price less than 3000" do
      order = FactoryGirl.build(:order, :price => 300)
      order.generate_discount
      expect(order.discount).to eq(0)
    end
    
    it "generates 10% discount if price greater than 3000 and lessthan 4500" do
      order = FactoryGirl.build(:order, :price => 3500)
      order.generate_discount
      expect(order.discount).to eq(350)
    end
    
  end
  
  context "#get_user_orders" do
    context "if user is having fullname" do
      it "should return good" do
        user = stub("Test")
        user.stub(:full_name).and_return(:true)
        Order.get_user_orders(user).should == "good"
      end
      it "should return very good" do
        user = mock("Test")
        user.should_receive(:full_name).exactly(5).and_return(:true)
        Order.get_user_orders(user).should == "good"
      end
    end
    context "if the user does not have full name" do
      
    end
  end
  
end
