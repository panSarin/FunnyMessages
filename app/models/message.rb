class Message < ApplicationRecord
  validates :content, :content_with_dialect, presence: true

end
