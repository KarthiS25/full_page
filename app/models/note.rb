class Note < ApplicationRecord
    
    belongs_to :user
    has_one_attached :image
    validates :title, :content, :image, presence: true
    
end
