require_relative '../db/sql_runner'

class Order

  attr_reader :id, :first_name, :last_name, :address, :quantity, :size

  def initialize(params)
    @id = nil || params['id'].to_i
    @first_name = params['first_name']
    @last_name = params['last_name']
    @address = params['address']
    @quantity = params['quantity'].to_i
    @size = params['size']
  end

  def full_name()
    "#{@first_name} #{@last_name}"
  end

  def total
    return @quantity * 500
  end

  def save
    sql = "INSERT INTO orders (
    first_name, 
    last_name, 
    address, 
    quantity, 
    size) VALUES (
      '#{@first_name}', 
      '#{@last_name}', 
      '#{@address}', 
      #{@quantity},
      '#{@size}'
      ) RETURNING * ; "
      order_data = SqlRunner.run(sql)
      @id = order_data.first()['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM orders;"
    orders = SqlRunner.run(sql)
    result =  orders.map { |order| Order.new(order)} 
    return result
  end


end

