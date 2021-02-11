class Message < ApplicationRecord
  validates :content, length: { maximum: 255 }
  validates :content, presence: true, format: { without: /\A<\w*>.*<\/\w*>\z/ }
end
