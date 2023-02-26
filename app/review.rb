class Review < ApplicationRecord::Base

    belongs_to :user
    belongs_to :product

    def print_review
        return "Review for #{self.product.name} by #{self.user.name}: #{self.star_rating}. #{self.comment}"
   
    end
end
