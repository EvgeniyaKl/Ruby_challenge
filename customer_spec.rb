require_relative 'movie'
require_relative 'rental'
require_relative 'customer'

describe CustomerClass do 
   context "With valid input" do 

      it "should return correct string when one regular movie and days_rented <= 2" do
         reg_movie = Movie.new('Robocop', Movie::REGULAR)
         customer = CustomerClass.new('Vasya')
         customer.add_rental_object_to_list(Rental.new(reg_movie, 1))

         expected_result = "Rental Record for Vasya\n"
         expected_result += "\t" + reg_movie.title_for_movie + "\t" + 2.to_s + "\n"
         expected_result += "Amount owed is " + 2.to_s + "\n"
         expected_result += "You earned " + 1.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result 
      end
      
      it "should return correct string when one regular movie and days_rented > 2" do
         reg_movie = Movie.new('Robocop', Movie::REGULAR)
         customer = CustomerClass.new('Vasya')
         customer.add_rental_object_to_list(Rental.new(reg_movie, 4))

         expected_result = "Rental Record for Vasya\n"
         expected_result += "\t" + reg_movie.title_for_movie + "\t" + 5.0.to_s + "\n"
         expected_result += "Amount owed is " + 5.0.to_s + "\n"
         expected_result += "You earned " + 1.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result 
      end
      
      it "should return correct string when one NEW_RELEASE movie and days_rented = 1" do
         new_release_movie = Movie.new('Robocop', Movie::NEW_RELEASE) 
         customer = CustomerClass.new('Vasya')
         customer.add_rental_object_to_list(Rental.new(new_release_movie, 1))

         expected_result = "Rental Record for Vasya\n"
         expected_result += "\t" + new_release_movie.title_for_movie + "\t" + 3.to_s + "\n"
         expected_result += "Amount owed is " + 3.to_s + "\n"
         expected_result += "You earned " + 1.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result 
      end
      
      it "should return correct string when one NEW_RELEASE movie and days_rented > 1" do
         new_release_movie = Movie.new('Robocop', Movie::NEW_RELEASE)
         customer = CustomerClass.new('Vasya')
         customer.add_rental_object_to_list(Rental.new(new_release_movie, 4))

         expected_result = "Rental Record for Vasya\n"
         expected_result += "\t" + new_release_movie.title_for_movie + "\t" + 12.to_s + "\n"
         expected_result += "Amount owed is " + 12.to_s + "\n"
         expected_result += "You earned " + 2.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result 
      end
      
      it "should return correct string when one CHILDRENS_MOVIE movie and days_rented <= 3" do
         children_movie = Movie.new('Robocop', Movie::CHILDRENS_MOVIE) 
         customer = CustomerClass.new('Vasya')
         customer.add_rental_object_to_list(Rental.new(children_movie, 2))

         expected_result = "Rental Record for Vasya\n"
         expected_result += "\t" + children_movie.title_for_movie + "\t" + 1.5.to_s + "\n"
         expected_result += "Amount owed is " + 1.5.to_s + "\n"
         expected_result += "You earned " + 1.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result 
      end
      
      it "should return correct string when one CHILDRENS_MOVIE movie and days_rented > 3" do
         children_movie = Movie.new('Robocop', Movie::CHILDRENS_MOVIE)
         customer = CustomerClass.new('Vasya')
         customer.add_rental_object_to_list(Rental.new(children_movie, 5))

         expected_result = "Rental Record for Vasya\n"
         expected_result += "\t" + children_movie.title_for_movie + "\t" + 4.5.to_s + "\n"
         expected_result += "Amount owed is " + 4.5.to_s + "\n"
         expected_result += "You earned " + 1.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result 
      end
      
      it "should return correct string when one regular movie and days_rented <= 2, one NEW_RELEASE movie and days_rented = 1, 
      CHILDRENS_MOVIE movie and days_rented <= 3" do
         reg_movie = Movie.new('Robocop', Movie::REGULAR)
         new_release_movie = Movie.new('Man in black', Movie::NEW_RELEASE)
         children_movie = Movie.new('Madagascar', Movie::CHILDRENS_MOVIE)
         customer = CustomerClass.new('Vasya')
         customer.add_rental_object_to_list(Rental.new(reg_movie, 2))
         customer.add_rental_object_to_list(Rental.new(new_release_movie, 1))
         customer.add_rental_object_to_list(Rental.new(children_movie, 3))
         
         expected_result = "Rental Record for Vasya\n"
         expected_result += "\t" + reg_movie.title_for_movie + "\t" + 2.to_s + "\n"
         expected_result += "\t" + new_release_movie.title_for_movie + "\t" + 3.to_s + "\n"
         expected_result += "\t" + children_movie.title_for_movie + "\t" + 1.5.to_s + "\n"
         expected_result += "Amount owed is " + 6.5.to_s + "\n"
         expected_result += "You earned " + 3.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result 
      end
      
      it "should return correct string when one regular movie and days_rented > 2, one NEW_RELEASE movie and days_rented > 1, 
      CHILDRENS_MOVIE movie and days_rented > 3" do
         reg_movie = Movie.new('Robocop', Movie::REGULAR)
         new_release_movie = Movie.new('Man in black', Movie::NEW_RELEASE)
         children_movie = Movie.new('Madagascar', Movie::CHILDRENS_MOVIE)
         customer = CustomerClass.new('Vasya')
         customer.add_rental_object_to_list(Rental.new(reg_movie, 4))
         customer.add_rental_object_to_list(Rental.new(new_release_movie, 5))
         customer.add_rental_object_to_list(Rental.new(children_movie, 6))
         
         expected_result = "Rental Record for Vasya\n"
         expected_result += "\t" + reg_movie.title_for_movie + "\t" + 5.0.to_s + "\n"
         expected_result += "\t" + new_release_movie.title_for_movie + "\t" + 15.to_s + "\n"
         expected_result += "\t" + children_movie.title_for_movie + "\t" + 6.0.to_s + "\n"
         expected_result += "Amount owed is " + 26.0.to_s + "\n"
         expected_result += "You earned " + 4.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result 
      end
      
      it "should return correct string when no rentals" do

         customer = CustomerClass.new('Vasya')

         expected_result = "Rental Record for Vasya\n"
         expected_result += "Amount owed is " + 0.to_s + "\n"
         expected_result += "You earned " + 0.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result
      end
	  
	  it "should return correct string when no customer_name" do

         customer = CustomerClass.new('')

         expected_result = "Rental Record for \n"
         expected_result += "Amount owed is " + 0.to_s + "\n"
         expected_result += "You earned " + 0.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result
      end
	  
	  it "should return correct string when customer_name is nil" do

         customer = CustomerClass.new(nil)

         expected_result = "Rental Record for \n"
         expected_result += "Amount owed is " + 0.to_s + "\n"
         expected_result += "You earned " + 0.to_s + " frequent renter points"
         expect(customer.statement).to eq expected_result
      end
   end 
end
