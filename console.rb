require("PG")
require("pry")
require_relative("models/film.rb")
require_relative("models/customer.rb")


customer1 = Customer.new({'name'=>'Joao', 'funds'=> 100})
customer1.save()
customer2 = Customer.new({'name'=>'Jonathan', 'funds'=> 100})
customer2.save()
customer3 = Customer.new({'name'=> 'Margaret', 'funds'=> 50})
customer3.save()

film1 = Film.new({'title' => 'Blade Runner', 'price'=> 10})

film2 = Film.new({'title' => 'Lord of the Rings', 'price'=> 20})

film3 = Film.new({'title' => 'Titanic', 'price'=> 5})


binding.pry

nil
