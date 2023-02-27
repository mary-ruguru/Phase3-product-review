class Review < ApplicationRecord::Base
    
          #Review
    #Review#user
     #Returns the User instance for this Review
    #Review#product
      #Returns the Product instance for this Review

    belongs_to :user
    belongs_to :product
    
    Review#print_review
  #This should puts in the terminal a string formatted as follows: Review for {insert product name} by {insert user name}: {insert review star_rating}.    {insert review comment}


    def print_review
        return "Review for #{self.product.name} by #{self.user.name}: #{self.star_rating}. #{self.comment}"
   
    end
end
