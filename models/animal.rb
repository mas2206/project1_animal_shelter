require_relative('../db/sql_runner')

class Animal

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @age = options['age'].to_i
    @species = options['species']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @ready_for_adoption = options['ready_for_adoption']
    @bio = options['bio']
  end

end