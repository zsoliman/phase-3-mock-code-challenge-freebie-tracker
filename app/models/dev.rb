class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        if self.freebies.find_by(item_name: item_name) != nil
            true
        else
            false
        end
    end

    # OR
    # def received_one?(item_name)
    #   self.freebies.any? do |freebie|
    #       freebie.item_name == item_name
    #   end
    # end

    def give_away(dev, freebie)
        if freebie.dev_id == self.id
        freebie.update(dev_id: dev.id)
        else
            "that doesn't belong to you"
        end
    end

    # OR
    # def give_away(dev, freebie)
    #   freebie.update(dev: dev) unless freebie.dev != self
    # end

end
