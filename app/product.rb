class Product < ApplicationRecord::Base

    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user:, star_rating:, comment:)
        @user = user
        @star_rating = star_rating
        @comment = comment
        user_instance = self.users.find_by(name: @user)
        self.reviews.create(star_rating: @star_rating, comment: @comment, user_id: user_instance.id, product_id: self.id)
    end

    def print_all_reviews
        self.reviews.map do |r|
            puts "Review for #{self.name} by #{self.users.find(r.user_id).name}: #{r.star_rating}. #{r.comment}"
        end
    end

    def average_rating
        rating = self.reviews.map {|r| r.star_rating}
        rating.sum(0.0) / rating.size
    end
end