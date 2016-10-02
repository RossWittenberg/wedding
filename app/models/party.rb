class Party < ActiveRecord::Base
  has_many :guests, dependent: :destroy
end