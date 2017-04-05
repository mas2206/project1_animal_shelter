require_relative('../db/sql_runner.rb')

class Animal

  attr_reader :id, :name, :type, :admission_date, :availability
  attr_writer :availability

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @admission_date = options['admission_date']
    @availability = options['availability']
  end

  def owner()
    sql = "SELECT owners.* from owners INNER JOIN adoptions ON adoptions.owner_id = owners.id WHERE animal_id = #{@id};"
    owners = SqlRunner.run(sql)
    result = owners.map {|owner| Owner.new(owner)}
    return result
  end

  def save()
    sql = "INSERT INTO animals (name, type, admission_date, availability) VALUES ('#{@name}', '#{@type}', '#{@admission_date}', '#{@availability}') RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE animals SET name = '#{@name}', type = '#{@type}', admission_date = '#{@admission_date}', availability = '#{@availability}' WHERE id = '#{@id}';"
    SqlRunner.run(sql)
  end

  def become_adopted()
    @availability = 'f'
    update()
  end

  def become_available()
    @availability = 't'
    update()
  end

  def self.get_adoptable()
    sql = "SELECT * FROM animals WHERE availability = true;"
    results = SqlRunner.run(sql)
    return results.map {|animals_hash| Animal.new(animals_hash)}
  end

  def self.get_non_adoptable()
    sql = "SELECT * FROM animals WHERE availability = false;"
    results = SqlRunner.run(sql)
    return results.map {|animals_hash| Animal.new(animals_hash)}
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM animals;"
    results = SqlRunner.run(sql)
    return results.map {|animals_hash| Animal.new(animals_hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM animals WHERE id = #{id};"
    results = SqlRunner.run(sql)
    return Animal.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM animals;"
    SqlRunner.run(sql)
  end

end