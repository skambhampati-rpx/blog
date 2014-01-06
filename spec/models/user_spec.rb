require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
    @order1 = FactoryGirl.create(:order)
    @order2 = FactoryGirl.create(:order, :item_name => "fruites")
    @order3 = FactoryGirl.create(:order, :item_name => "books")
  end
  
  it {should have_many(:orders) }
  it{should have_many(:active_orders).conditions("where orderd_date > #{Time.now}").class_name("Order")}
  it{should have_many(:posts)}
  
  it "user can place only two orders " do
    @user.order_ids=[@order1.id, @order2.id, @order3.id]
    expect{@user.save}.to raise_error
  end
  
end
