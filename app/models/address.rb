class Address < ActiveRecord::Base

attr_accessible :country, :city, :street, :zipcode

belongs_to :user

validates :street, :city, :zipcode, :presence => true

before_save :set_country

def set_country
  puts "i am in checking method"
  puts self.country
  self.country = "USA" if self.country.blank?
end

end
