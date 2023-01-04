class Transaction < ApplicationRecord

    def add_item(id, item)
        transaction = Transaction.find_by(id: id)
        transaction.items.push(item)
        transaction.save
    end

    def show_items(id)

    end
end
