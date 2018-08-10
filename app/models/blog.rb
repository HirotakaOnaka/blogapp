class Blog < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { in:1..500 }
end