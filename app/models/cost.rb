class Cost < ActiveRecord::Base
  belongs_to :costtable, polymorphic: true
  belongs_to :trip
end