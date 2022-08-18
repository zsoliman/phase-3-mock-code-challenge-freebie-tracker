class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name,  value)
        f = Freebie.create(item_name: item_name, value: value, company_id: self.id, dev_id: dev.id)
    end

    def self.oldest_company
        Company.all.order(:founding_year).first
    end

end
