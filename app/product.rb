class Product < ApplicationRecord::Base
    
   #Product#reviews
     #Returns a collection of all the Reviews for the Product
   #Product#users
     #Returns a collection of all the Users who reviewed the Product

    has_many :reviews
    has_many :users, through: :reviews

    #Product#leave_review(user, star_rating, comment)
    #Takes a User (an instance of the User class), a star_rating (integer), and a comment (string) as arguments, and creates a new Review in the database associated with this Product and the User
    
    def leave_review(user:, star_rating:, comment:)
        @user = user
        @star_rating = star_rating
        @comment = comment
        user_instance = self.users.find_by(name: @user)
        self.reviews.create(star_rating: @star_rating, comment: @comment, user_id: user_instance.id, product_id: self.id)
    end

    #Product#print_all_reviews
    def print_all_reviews
        self.reviews.map do |r|
            puts "Review for #{self.name} by #{self.users.find(r.user_id).name}: #{r.star_rating}. #{r.comment}"
        end
    end

    #Product#average_rating
    #Returns a float representing the average star rating for all reviews for this product
    def average_rating
        rating = self.reviews.map {|r| r.star_rating}
        rating.sum(0.0) / rating.size
    end
    
end
