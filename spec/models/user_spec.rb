require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user) 
    @order1 = FactoryGirl.create(:order)
    @order2 = FactoryGirl.create(:order, :item_name => "fruites")
    @order3 = FactoryGirl.create(:order, :item_name => "books")
  end
  
  # Testing Associations
  context "Associations" do
    it {should have_many(:orders) }
    it{should have_many(:active_orders).conditions("where orderd_date > #{Time.now}").class_name("Order")}
    it{should have_many(:posts)}
    it{should have_many(:addresses)}    
  end
  
  # Testing Validations  
  context "Validations" do
    
    it{should validate_presence_of(:first_name)}
    
    it{should validate_presence_of(:last_name)}
    
    it{should_not validate_presence_of(:middle_name)}    
    
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
=begin    
    it "has street name for address" do
    user = FactoryGirl.create(:user) 
    user.addresses << FactoryGirl.build(:address, :street => "")
    user.addresses.first.valid?
    expect(user.addresses.first.errors[:street]).not_to  be_nil
  end
=end
  end
  
  
  # Testing Named Scopes
  context "List Admin Users" do
    it "should list empty admins " do
      User.admins.should == []
    end
    
    it "should list all admins" do
      admin1 = FactoryGirl.create(:user, :admin => true)
      admin2 = FactoryGirl.create(:user, :first_name => "Shekbaba", :admin => true)
      user3 = FactoryGirl.create(:user, :first_name=> "Sateesh", :last_name => "Kambhampati", :middle_name =>"Harshu")
      User.admins.should == [admin1, admin2]
      end
  end
  
  
  it "user can place only two orders " do
    @user.order_ids=[@order1.id, @order2.id, @order3.id]
    expect{@user.save}.to raise_error
  end
  
  
  
  it "set Default country as U.S.A" do
    user = FactoryGirl.create(:user) 
    user.addresses = [FactoryGirl.create(:address, :country => "")]
    user.addresses.first.country.should == "USA"
  end
  
  
  
  
  
  describe "#full_name" do
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
  
  
  context ".Autocomplete" do
    it "should get all records" do
      sat = FactoryGirl.create(:user, :first_name=> "Sateesh", :last_name => "Kambhampati")
      joe = FactoryGirl.create(:user, :first_name=> "Robin", :last_name => "Joe")
      kai = FactoryGirl.create(:user, :first_name=> "Robin", :last_name => "kai")
      User.get_by_name("b").should == [sat,joe,kai]
    end
  end  
  
  
  
end
