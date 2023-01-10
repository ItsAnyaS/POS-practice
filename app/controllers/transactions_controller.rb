class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        number_of_items = 0
        item_ids = []
        total = 0
        tax = 0
        tip = 0
        total_tax = 0
        #!Need to add tax rate from user (user.tax_rate)
        user = User.first
        items = params[:cart].map do |item|
            number_of_items +=1
            tax = (item["price"].to_i * user.tax_rate)/100
            total_tax += (item["price"].to_i * user.tax_rate)/100
            total += item["price"].to_i + tax
            Item.find_by(name: item["name"]).id
        end
        total += params[:tip].to_i
        transaction = Transaction.create(number_of_items: number_of_items, items: items, total: total, tax: total_tax, tip: params[:tip], period_id: params[:period_id])
        render json: transaction
    end

end
