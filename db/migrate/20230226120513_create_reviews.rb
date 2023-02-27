class CreateReviews < ActiveRecord::Migration[7.0]
  
  #A Review belongs to a Product, and a Review also belongs to a User. In your migration, create any columns your reviews table will need to establish these relationships.
  #The reviews table should also have:
  #A star_rating column that stores an integer.
  #A comment column that stores a string.
  def change
    create_table :reviews do |t|
      t.integer :star_rating
      t.string :comment
      t.integer :user_id
      t.integer :product_id

      
      
    end  
  end
end

#NB: my seeding did not work because of uninitialized constant on the product create_product.... but i checked how i had named my class and they were all correct
