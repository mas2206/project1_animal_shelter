require_relative('../db/sql_runner')

class Animal

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @species = options['species']
    @admission_date = options['admission_date']
  end

  def save()
    sql = "INSERT INTO animals (name, species, admission_date) VALUES ('#{@name}', '#{@species}', '#{@admission_date}') RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first['id'].to_i
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