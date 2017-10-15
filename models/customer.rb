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


  def save()
    sql = "INSERT INTO customers(name,funds) VALUES($1, $2) RETURNING id"
    values = [@name, @funds]

    costumer = SqlRunner.run(sql,values)

    @id = costumer[0]['id'].to_i

  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []

    list = SqlRunner.run(sql,values)
    return list.map {|customer| Customer.new(customer)}
  end

  def delete()
    sql = "DELETE FROM customers  WHERE id = $1"
    values =[@id]

    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE customers SET(name,funds)=($1,$2) WHERE id = $3"
    values =[@name,@funds,@id]
    SqlRunner.run(sql,values)
  end

  def films()
    sql= "SELECT films.* FROM films INNER JOIN tickets on films.id = film_id WHERE customer_id = $1"
    values = [@id]

    results = SqlRunner.run(sql,values)

    return results.map {|film| Film.new(film)}

  end

  def count_films()
    sql= "SELECT films.* FROM films INNER JOIN tickets on films.id = film_id WHERE customer_id = $1"
    values = [@id]

    results = SqlRunner.run(sql,values)

    array_results = results.map {|film| Film.new(film)}
    return array_results.count

  end

  def buy_ticket(film)
    @funds -= film.price
    ticket = Ticket.new({'customer_id'=> @id, 'film_id'=> film.id})
    ticket.save()
      update()
    end

  end
