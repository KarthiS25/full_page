class Post < ApplicationRecord
    belongs_to :articles
    validates :name, :title, :content, :email, presence: true
end
