class PreviewsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit]

    def new
        # raise params
        @one_gem=Mygem.find(params[:mygem_id])
        @review=Preview.new
    end

    def create
        # raise params
        @one_gem=Mygem.find(params[:mygem_id])
        var_rating=params[:preview][:rating]
        var_comment=params[:preview][:comment]
        Preview.create(rating: var_rating, comment: var_comment, mygem_id: params[:mygem_id], user_id: current_user.id)
        redirect_to mygem_path(@one_gem)
    end

    def edit
        # raise params
        @one_gem=Mygem.find(params[:mygem_id])
        @one_review=Preview.find_by(id: params[:id])
    end

    def update
        # raise params
        @one_gem=Mygem.find(params[:mygem_id])
        @one_review=Preview.find_by(id: params[:id])
        var_edited_rating=params[:preview][:rating]
        var_edited_comment=params[:preview][:comment]
        @one_review.update(rating: var_edited_rating, comment: var_edited_comment)
        redirect_to mygem_path(@one_gem)
    end

    def destroy
        # raise params
        @one_gem=Mygem.find(params[:mygem_id])
        @one_review=Preview.find_by(id: params[:id])
        @one_review.destroy
        redirect_to mygem_path(@one_gem)
    end
    
end
