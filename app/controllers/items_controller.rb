class ItemsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def items_by_category
        render json: Item.where(category_id: params[:categoryId])
    end
end
