class Trip < ActiveRecord::Base 
  has_many :hotels
  has_many :stops
  has_many :costs
  has_many :providers
end