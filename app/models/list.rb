class List < ActiveRecord::Base
  has_many :subscriptions
  has_many :emails, through: :subscriptions
end
