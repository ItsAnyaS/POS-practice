class Transaction < ApplicationRecord

    def add_item(item)
        # transaction = Transaction.find_by(id: id)
        self.items << item
        self.save
    end

    def show_items
        puts self.items
    end
    
end
