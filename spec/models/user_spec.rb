require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
    @order1 = FactoryGirl.create(:order)
    @order2 = FactoryGirl.create(:order, :item_name => "fruites")
    @order3 = FactoryGirl.create(:order, :item_name => "books")
  end
  
  #Associations
  it {should have_many(:orders) }
  it{should have_many(:active_orders).conditions("where orderd_date > #{Time.now}").class_name("Order")}
  it{should have_many(:posts)}
  
  #Validations
  it{should validate_presence_of(:first_name)}
  it{should validate_presence_of(:last_name)}
  it{should_not validate_presence_of(:middle_name)}
  it "user can place only two orders " do
    @user.order_ids=[@order1.id, @order2.id, @order3.id]
    expect{@user.save}.to raise_error
  end
  
  
  it "has first name should  be not nil" do
    user = FactoryGirl.build(:user, :first_name => nil)
    user.should_not be_valid
    expect(user.errors[:first_name]).not_to be_nil
  end
  
  it "has last name should  be mandatory" do
    user = FactoryGirl.build(:user, :last_name => nil)
    user.should_not be_valid
    expect(user.errors[:last_name]).not_to be_nil
  end
  
  it "has middle name as optional" do
    
  end

  context "#full_name" do
    context "when middle_name is there" do
      it "should return full_name by joining first_name, middle_name and last_name" do
        user = FactoryGirl.create(:user, :first_name=> "Sateesh", :last_name => "Kambhampati", :middle_name =>"Harshu")
        user.full_name.should  == "Sateesh Harshu Kambhampati"
      end
    end
    context "when middle_name is not there" do
      it "should return full_name by joining first_name and last_name" do
        user = FactoryGirl.create(:user, :first_name=> "Sateesh", :last_name => "Kambhampati")
        user.full_name.should  == "Sateesh Kambhampati"
      end
    end
  end
  
  
end
