class Email < ActiveRecord::Base
  has_many :subscriptions
  has_many :lists, through: :subscriptions
end
