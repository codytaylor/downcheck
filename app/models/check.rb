class Check < ActiveRecord::Base
  belongs_to :user
  has_many :check_datum
end
