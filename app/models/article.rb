class Article < ApplicationRecord
    include Visible
    has_many :comments, depenent: :destroy

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
