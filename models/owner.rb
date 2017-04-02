require_relative('../db/sql_runner')

class Owner

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO owners (name) VALUES ('#{@name}') RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def delete()
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