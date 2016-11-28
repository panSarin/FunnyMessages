class User < ApplicationRecord
  acts_as_authentic
  validates :name, :dialect, presence: true
end
