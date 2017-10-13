require("PG")
require_relative("film.rb")
require_relative("customer.rb")
require_relative("../db/sql_runner.rb")

class Customer

  attr_accessor(:customer_id, :film_id)
  attr_reader(:id)

  def initialize(ticket)
    @id = ticket['id'].to_i if ticket['id']
    @customer_id = ticket['customer_id']
    @film_id = ticket["film_id"]
  end


end
