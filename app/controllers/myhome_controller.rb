class MyhomeController < ApplicationController

    def index
    end

    def activity
        @my_created_gems=Mygem.all.where(user_id: current_user.id).order("created_at DESC")
    end

    def search
        @query=params[:search_query]
        Mygem.add_user_query(@query)
        @search_results=Mygem.gems_search.paginate(page: params[:page], per_page: 5)
    end

    def search_basic
        # raise params
        @query=params[:search_query]
        if @query.blank?
            @search_results=Mygem.all.paginate(page: params[:page], per_page: 5).order("created_at DESC")
        else
            @search_results=Mygem.where("title LIKE ? OR description LIKE ?", "%#{@query}%", "%#{@query}%").paginate(page: params[:page], per_page: 5).order("created_at DESC") 
        end
    end
    
end
