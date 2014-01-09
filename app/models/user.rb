class User < ActiveRecord::Base

  #Associations
  has_many :posts
  has_many :orders
  has_many :active_orders, :class_name => "Order",   :conditions => ["where orderd_date >= ?", Time.now]
  has_many :addresses
  
  #Validations
  validates :first_name, :last_name,  :presence => true
  before_save :get_orders_count
  
  #named scopes
  scope :admins, lambda {where(:admin => true)}
  
  def full_name
    if self.middle_name
      [self.first_name, self.middle_name, self.last_name].join(" ")
    else
      [self.first_name, self.last_name].join(" ")
    end
  end
  
  def self.get_by_name(name)
    self.where("first_name like ? or last_name like ?", "%#{name}%", "%#{name}%")
  end
  
  private
  
  def get_orders_count
    if self.orders.count > 2
      raise "User can place only two orders"
    end
  end
  
end
