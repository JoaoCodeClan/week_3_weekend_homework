require("PG")
require("pry")
require_relative("models/film.rb")
require_relative("models/customer.rb")

Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'name'=>'Joao', 'funds'=> 100})
customer1.save()
customer2 = Customer.new({'name'=>'Jonathan', 'funds'=> 100})
customer2.save()
customer3 = Customer.new({'name'=> 'Margaret', 'funds'=> 50})
customer3.save()

film1 = Film.new({'title' => 'Blade Runner', 'price'=> 10})
film1.save()
film2 = Film.new({'title' => 'Lord of the Rings', 'price'=> 20})
film2.save()
film3 = Film.new({'title' => 'Titanic', 'price'=> 5})
film3.save()

ticket1= Ticket.new({'customer_id'}=> customer1, 'film_id'=> film1)
ticket1.save()

ticket2= Ticket.new({'customer_id'}=> customer1, 'film_id'=> film2)
ticket2.save()

ticket3= Ticket.new({'customer_id'}=> customer2, 'film_id'=> film1)
ticket3.save()


binding.pry

nil
