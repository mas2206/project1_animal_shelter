require_relative('../db/sql_runner')

class Adoption

  def initialize(options)
    @id = options['id'].to_i
    @animal_id = options['animal_id'].to_i
    @owner_id = options['owner_id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions (animal_id, owner_id) VALUES (#{@animal_id}, #{@owner_id}) RETURNING *;"
    results = SqlRunner.run(sql)
    @id = results.first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM adoptions;"
    results = SqlRunner.run(sql)
    return results.map {|adoptions_hash| Adoption.new(adoptions_hash)}
  end

  def self.find(id)
    sql = "SELECT FROM adoptions WHERE id = #{@id};"
    results = SqlRunner.run(sql)
    return Adoption.new(results.first)
  end

  def delete_all()
    sql = "DELETE FROM adoptions;"
    SqlRunner.run(sql)
  end

end