require_relative('../db/sql_runner')

class Owner

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @species_preference = options['species_preference']
    @breed_preference = options['breed_preference']
  end

end