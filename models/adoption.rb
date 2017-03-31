require_relative('../db/sql_runner')

class Adoption

  def initialize(options)
    @id = options['id'].to_i
    @animal_id = options['animal_id']
    @owner_id = options['owner_id']
  end

end