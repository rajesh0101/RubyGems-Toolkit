class MygemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit]

    def index
        # raise params
        @test=params[:starts_with]
        if params[:starts_with].blank?
            @all_gems=Mygem.all.paginate(page: params[:page], per_page: 5).order("created_at DESC")
        else
            search=params[:starts_with]
            @all_gems=Mygem.where("title LIKE ?", "#{search}%").paginate(page: params[:page], per_page: 5).order("created_at DESC")
        end
    end

    def show
        @one_gem=Mygem.find_by(id: params[:id])
        @all_previews=@one_gem.previews.order("created_at DESC")

        if @one_gem.previews.blank?
            @average_review=0
        else
            @average_review=@one_gem.previews.average("rating").round(2)
        end
    end

    def new
        @mygem=Mygem.new
        @all_categories=Category.all.map{ |c| [c.name, c.id] }
    end

    def create
        # raise params
        var_category=params[:c_id]
        var_title=params[:mygem][:title]
        var_desc=params[:mygem][:description]
        
        @mygem=Mygem.new(category_id: var_category, title: var_title, description: var_desc, user_id: current_user.id)
        if !@mygem.save
            flash[:alert] = "Please fill in all the fields, and try again!"
            redirect_to new_mygem_path
        else
            redirect_to mygems_path
        end
    end

    def edit
        @one_gem_edit=Mygem.find_by(id: params[:id])
        @all_categories=Category.all.map{ |c| [c.name, c.id] }
    end

    def update
        @one_gem_edit=Mygem.find_by(id: params[:id])
        var_category=params[:mygem][:category_id]
        var_title=params[:mygem][:title]
        var_desc=params[:mygem][:description]

        if @one_gem_edit.update(category_id: var_category, title: var_title, description: var_desc)
            redirect_to mygem_path(@one_gem_edit)
        else
            flash[:alert] = "Please fill in all the fields, and try again!"
            redirect_to edit_mygem_path(@one_gem_edit)
        end
    end

    def destroy
        @one_gem_destroy=Mygem.find_by(id: params[:id])
        @one_gem_destroy.destroy
        redirect_to mygems_path
    end

end
