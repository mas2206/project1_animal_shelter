require_relative('../models/animal')
require_relative('../models/owner')
require_relative('../models/adoption')
require('pry-byebug')

Adoption.delete_all()
Owner.delete_all()
Animal.delete_all()

animal1 = Animal.new({
  "name" => "Rover",
  "type" => "dog",
  "admission_date" => "2016-12-25",
  "availability" => true
  })

animal2 = Animal.new({
  "name" => "Rascal",
  "type" => "cat",
  "admission_date" => "2017-02-10",
  "availability" => true
  })

animal3 = Animal.new({
  "name" => "Alfie",
  "type" => "tortoise",
  "admission_date" => "2017-03-29",
  "availability" => true
  })

animal4 = Animal.new({
  "name" => "Goldy",
  "type" => "goldfish",
  "admission_date" => "2017-01-22",
  "availability" => true
  })

animal5 = Animal.new({
  "name" => "Wilfred",
  "type" => "dog",
  "admission_date" => "2016-11-25",
  "availability" => true
  })

animal6 = Animal.new({
  "name" => "Gerry",
  "type" => "gerbil",
  "admission_date" => "2017-02-02",
  "availability" => true
  })

animal7 = Animal.new({
  "name" => "Felix",
  "type" => "cat",
  "admission_date" => "2015-08-14",
  "availability" => true
  })

animal1.save()
animal2.save()
animal3.save()
animal4.save()
animal5.save()
animal6.save()
animal7.save()

owner1 = Owner.new({
  "name" => "Zsolt"
  })

owner2 = Owner.new({
  "name" => "John"
  })

owner3 = Owner.new({
  "name" => "Sandy"
  })

owner4 = Owner.new({
  "name" => "Darren"
  })

owner5 = Owner.new({
  "name" => "Matthew"
  })

owner1.save()
owner2.save()
owner3.save()
owner4.save()
owner5.save()

adoption1 = Adoption.new({
  "animal_id" => animal1.id,
  "owner_id" => owner1.id
  })

adoption2 = Adoption.new({
  "animal_id" => animal6.id,
  "owner_id" => owner4.id
  })

adoption1.save()
adoption2.save()

binding.pry
nil