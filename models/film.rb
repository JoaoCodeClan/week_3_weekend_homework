require("PG")
require_relative("customer.rb")
require_relative("../db/sql_runner.rb")
class Film

  attr_accessor(:title, :price)
  attr_reader(:id)


  def initialize(film)
    @id = film['id'].to_i if film['id']
    @title = film['title']
    @price = film['price'].to_i
  end

  def save()
    sql = "INSERT INTO films(title, price) VALUES($1, $2) RETURNING id"
    values = [@title, @price]

    films = SqlRunner.run(sql,values)

    @id = films[0]['id'].to_i

  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []

    list_of_films = SqlRunner.run(sql,values)
    return list_of_films.map {|film| Film.new(film)}
  end

  def delete()
    sql = "DELETE FROM films  WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE films SET(title, price)=($1,$2) WHERE id = $3"
    values =[@title, @price, @id]
    SqlRunner.run(sql,values)
  end

  def customers()
    sql= "SELECT customers.name FROM customers INNER JOIN tickets on customers.id = customer_id WHERE film_id = $1"
    values = [@id]

    results = SqlRunner.run(sql,values)

    return results.map {|customer| Customer.new(customer)}

  end

end
