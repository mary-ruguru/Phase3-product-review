class User < ApplicationRecord::Base

    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        rev_star_rating=self.reviews.map{|r| r.star_rating}.max
        rev1 = self.reviews.find_by(star_rating: rev_star_rating)
        self.products.find(rev1.product_id)
    end

   
    def remove_reviews(product)
        @product=product
        prod=self.products.find_by(name: @product)
        rev = self.reviews.find_by(product_id: prod.id)
        self.reviews.destroy(rev.id)
    end
end
