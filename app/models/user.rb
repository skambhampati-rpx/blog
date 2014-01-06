class User < ActiveRecord::Base
has_many :posts

has_many :orders

has_many :active_orders, :class_name => "Order",   :conditions => ["where orderd_date >= ?", Time.now]
before_save :get_orders_count

private

def get_orders_count
  if self.orders.count > 2
    raise "User can place only two orders"
  end
end

end
