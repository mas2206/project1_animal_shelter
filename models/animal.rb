require_relative('../db/sql_runner')

class Animal

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @species = options['species']
    @admission_date = options['admission_date']
  end

end