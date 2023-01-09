class ItemsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def items_by_category
        render json: Item.where(category_id: params[:categoryId])
    end

    def create
        if !Item.find_by(name: params[:name].downcase)
            category = Category.find_by(name: params[:category_name])
            item = Item.create(name: params[:name], price: params[:price], category_id: category.id)
            render json: item
        else 
            render json: {message: "There is already a item with that name"}
        end
    end
end
