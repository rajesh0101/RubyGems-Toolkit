class Category < ApplicationRecord
    has_many :mygems

    validates :name, presence: true
end
