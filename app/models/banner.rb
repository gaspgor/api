class Banner < ApplicationRecord
  validates :name, presence: true
  validates :text, presence: true
end
