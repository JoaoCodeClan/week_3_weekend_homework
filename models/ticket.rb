require("PG")
require_relative("film.rb")
require_relative("customer.rb")
require_relative("../db/sql_runner.rb")

class Ticket

  attr_accessor(:customer_id, :film_id)
  attr_reader(:id)

  def initialize(ticket)
    @id = ticket['id'].to_i if ticket['id']
    @customer_id = ticket['customer_id'].to_i
    @film_id = ticket["film_id"].to_i
  end

  def save()
    sql = "INSERT INTO tickets(customer_id, film_id) VALUES($1, $2) RETURNING id"
    values = [@customer_id, @film_id]

    tickets = SqlRunner.run(sql,values)
    @id = tickets[0]['id'].to_i
    
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    values = []

    list_of_tickets = SqlRunner.run(sql,values)
    return list_of_tickets.map {|ticket| Ticket.new(ticket)}
  end

  def delete()
    sql = "DELETE FROM tickets  WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql,values)
  end

  def update()
    sql = "UPDATE tickets SET(customer_id, film_id)=($1,$2) WHERE id = $3"
    values =[@customer_id, @film_id, @id]
    SqlRunner.run(sql,values)
  end




end
