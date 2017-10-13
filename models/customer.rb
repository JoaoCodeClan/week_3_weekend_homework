require("PG")
require_relative("film.rb")
require_relative("../db/sql_runner.rb")


class Customer

  attr_accessor(:name, :funds)
  attr_reader(:id)

  def initialize(customer)
    @id = customer['id'].to_i if customer['id']
    @name = customer['name']
    @funds = customer['funds'].to_i

  end


end
