require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items_array

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items_array = []
    end

    def add_item(name, cost, quantity=1)
        self.items_array << {
            :name => name, 
            :cost => cost, 
            :quantity => quantity
        }

        @total += cost * quantity
    end

    def apply_discount
        if(@discount != 0)
            self.total -= percentage_of(@discount, @total).round
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def percentage_of(percentage, number)
        percentage/100.00 * number
    end

    def void_last_transaction
        last_item = @items_array.pop
        self.total -= last_item[:cost] * last_item[:quantity]
        
    end

    def items
        item_name_array = []
        @items_array.each do |item|
            item[:quantity].times do 
                item_name_array << item[:name]
            end
        end

        item_name_array
    end
    
end

