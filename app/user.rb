class User < ApplicationRecord::Base
    
    #User#reviews
     #Returns a collection of all the Reviews that the User has given
    #User#products
     #Returns a collection of all the Products that the User has reviewed
     has_many :reviews
     has_many :products, through: :reviews

    #User#favorite_product
     #Returns the product instance that has the highest star rating from this user
    def favorite_product
        rev_star_rating=self.reviews.map{|r| r.star_rating}.max
        rev1 = self.reviews.find_by(star_rating: rev_star_rating)
        self.products.find(rev1.product_id)
    end

   
    #User#remove_reviews(product)
     #Takes a Product (an instance of the Product class) and removes all of this user's reviews for that product
     #You will have to delete any rows from the reviews table associated with this user and the product
    def remove_reviews(product)
        @product=product
        prod=self.products.find_by(name: @product)
        rev = self.reviews.find_by(product_id: prod.id)
        self.reviews.destroy(rev.id)
    end
end
