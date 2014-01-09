class Order < ActiveRecord::Base
  belongs_to :user
  
  validates :price, :presence => true, :numericality => {:greater_than => 0}
  
  validate :price_should_be_greater_than_discount
  
  
  def self.get_user_orders(user)
    user.full_name
    user.full_name
    user.full_name
    user.full_name
    if user.full_name
      "good"
    else
      "bad"
    end
  end
  
  
  def generate_discount
    if self.price < 3000
      self.discount = 0   
    elsif self.price >= 3000 && self.price <= 4500
      self.discount = (self.price*10)/100
    elsif self.price > 4500 && self.price  <= 6500
      self.discount = (self.price*20)/100
    elsif self.price > 6500 && self.price  <= 9000
      self.discount = (self.price*30)/100
    else
      self.discount = (self.price*40)/100
    end
  end
  
  private
  
  def price_should_be_greater_than_discount
    if (self.discount.present? && self.price.present?) && (self.discount > self.price)
      errors.add :base, "Price should be greater than discount"
    end
    
  end
  
end
