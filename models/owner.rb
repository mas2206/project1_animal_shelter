require_relative('../db/sql_runner.rb')

class Owner

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def animals()
    sql = "SELECT animals.* from animals INNER JOIN adoptions ON adoptions.animal_id = animals.id WHERE owner_id = #{@id};"
    animals = SqlRunner.run(sql)
    result = animals.map {|animal| Animal.new(animal)}
    return result
  end

  def save()
    sql = "INSERT INTO owners (name) VALUES ('#{@name}') RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE owners SET name = '#{@name}' WHERE id = '#{@id}';"
    SqlRunner.run(sql)
  end

  def delete()
    owner_animals = animals()
    owner_animals.each {|animal| animal.become_available()}
    sql = "DELETE FROM owners WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM owners;"
    results = SqlRunner.run(sql)
    return results.map {|owners_hash| Owner.new(owners_hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = #{id};"
    results = SqlRunner.run(sql)
    return Owner.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM owners;"
    SqlRunner.run(sql)
  end

end