class Message < ApplicationRecord
  validate :content, :content_by_dialect, presence: true
end
