class CategoriesController < ApplicationController

    skip_before_action :verify_authenticity_token


    def index
        render json: Category.all
    end

    def create
        if !Category.find_by(name: params[:name])
        category = Category.create(name: params[:name], description: params[:description])
        render json: category
        else 
            render json: { message: "There is already a category with that name"}
        end
    end
end
