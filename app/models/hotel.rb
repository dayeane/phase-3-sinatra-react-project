class Hotel < ActiveRecord::Base
  has_one :cost, as: :costtable
  belongs_to :trip
end