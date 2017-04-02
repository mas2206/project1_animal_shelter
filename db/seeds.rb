require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/adoption')
require('pry-byebug')


Adoption.delete_all()
Owner.delete_all()
Animal.delete_all()


animal1 = Animal.new({
  "name" => "Rover",
  "species" => "dog"
  })

animal2 = Animal.new({
  "name" => "Rascal",
  "species" => "cat"
  })

animal3 = Animal.new({
  "name" => "Alfie",
  "species" => "tortoise"
  })

animal1.save()
animal2.save()
animal3.save()


owner1 = Owner.new({
  "name" => "Zsolt"
  })

owner2 = Owner.new({
  "name" => "John"
  })

owner3 = Owner.new({
  "name" => "Sandy"
  })

owner1.save()
owner2.save()
owner3.save()


adoption1 = Adoption.new({
  "animal_id" => animal1.id,
  "owner_id" => owner1.id
  })

adoption1.save()



binding.pry
nil