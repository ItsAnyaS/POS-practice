class CategoriesController < ApplicationController

    skip_before_action :verify_authenticity_token


    def index
        render json: Category.all
    end
   
end
