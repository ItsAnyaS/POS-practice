class Transaction < ApplicationRecord

    belongs_to :period


    def add_item(item_id)
        # transaction = Transaction.find_by(id: id)
        period = Period.find_by(id: self.period_id)
        user = User.find_by(id: period.user_id)
        if item = Item.find_by(id: item_id)
        self.items << item_id
        self.number_of_items += 1
        tax_of_item = (item.price.to_i * user.tax_rate)/100
        self.tax += tax_of_item
        self.total += item.price.to_i + tax_of_item
        self.save
        end
    end

    def remove_item(item_id)
        item = Item.find_by(id: item_id)
        period = Period.find_by(id: self.period_id)
        user = User.find_by(id: period.user_id)
        if self.items.include? item_id
            index = self.items.index(item_id)
            self.items.delete_at(index)
            self.number_of_items -= 1
            tax_of_item = (item.price.to_i * user.tax_rate)/100
            self.tax -= tax_of_item
            self.total -= item.price.to_i + tax_of_item
            self.save
        end
    end




    def show_items
       self.items.map { |i|  Item.find_by(id: i)}
    end
    


end
