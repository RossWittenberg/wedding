class Guest < ActiveRecord::Base
  has_one :couple
  has_one :partner, through: :couple
end
