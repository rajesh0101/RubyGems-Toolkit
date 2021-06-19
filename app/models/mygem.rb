class Mygem < ApplicationRecord

    def self.add_user_query(user_query)
        @@search_query = user_query.to_s  
    end

    scope :gems_search, ->(n=@@search_query) { where("title LIKE ? OR description LIKE ?", "%#{n}%", "%#{n}%").order("created_at DESC") }

    belongs_to :user
    belongs_to :category
    has_many :previews

    validates :title, presence: true
    validates :description, presence: true
end
