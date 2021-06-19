class CategoriesController < ApplicationController

    def index
        @all_categories=Category.all.order("name ASC")
    end

    def show
        @one_category=Category.find_by(id: params[:id])
        @all_gems_under_this_category=Mygem.where(category_id: @one_category.id).paginate(page: params[:page], per_page: 5).order("created_at DESC")
    end
    
end
