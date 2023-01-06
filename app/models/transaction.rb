class Transaction < ApplicationRecord

    def add_item(item)
        # transaction = Transaction.find_by(id: id)
        self.items << item
        self.save
    end

    def remove_item(item)
        if self.items.include? item
            self.items.delete(item)
            self.save
            puts self.items
        end
    end

    def show_items
       self.items.map { |i|  Item.find_by(id: i)}
    end
    
end
