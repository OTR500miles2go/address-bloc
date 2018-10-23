require_relative '../models/address_book'
require_relative '../models/entry'
require 'bloc_record'

BlocRecord.connect_to('db/address_bloc.sqlite')

book = AddressBook.create(name: 'My Address Book')

puts 'Address Book created'
puts 'Entry created'
puts Entry.create(address_book_id: book.id, name: 'Foo One', phone_number: '999-999-9999', email: 'foo_one@gmail.com' )
puts Entry.create(address_book_id: book.id, name: 'Foo Two', phone_number: '111-111-1111', email: 'foo_two@gmail.com' )
puts Entry.create(address_book_id: book.id, name: 'Foo Three', phone_number: '222-222-2222', email: 'foo_three@gmail.com' )
puts "************************* Completed Entry Create *****************************"

puts "Update multiple attributes: one record"
puts Entry.update(1, {"name" => "Tina", "phone_number" => "100-200-3000", "email" => "tina@xyz.com"})
puts Entry.update(1, {"name" => "Foo One", "phone_number" => "999-999-9999", "email" => "foo_one@gmail.com"})
puts Entry.update(2, {"name" => "Foo Two", "phone_number" => "111-111-1111", "email" => "foo_two@gmail.com"})
puts Entry.update(3, {"name" => "Foo Three", "phone_number" => "222-222-2222", "email" => "foo_three@gmail.com"})
puts Entry.update(4, {"name" => "Anna", "phone_number" => "123-456-7890", "email" => "anna@abc.com"})
puts Entry.update(5, {"name" => "Mona", "phone_number" => "100-200-3000", "email" => "mona@123.com"})
puts "*********************** Completed Multiple Update ****************************"

puts "Update same attribute: multiple records"
people = { 1 => { "name" => "Kate Woo" }, 2 => { "name" => "Angie Foo" } }
Entry.update(people.keys, people.values)
puts "********************** Completed Attribute Update ****************************"

puts "Update multiple attributes: multiple records"
multiple_records = { 1 => {"name" => "Tina", "phone_number" => "100-200-3000", "email" => "tina@xyz.com"}, 2 => {"name" => "Jenny", "phone_number" => "400-500-6000", "email" => "jenny@xyz.com"}, 3 => {"name" => "Liz", "phone_number" => "700-800-9000", "email" => "liz@xyz.com"} }
Entry.update(multiple_records.keys, multiple_records.values)
puts "***************** Multi-attribute/Multi-records update ***********************"

puts "Update all"
puts Entry.where(name: "Foo One").update_all(name: "Foo Woo")
puts "*********************** Completed All *****************************"

puts "Entry take"
puts Entry.where(name: "Liz").take
puts "*********************** Completed Take ****************************"

puts "Entry where"
puts Entry.where(name: "Foo One").where(phone_number: '222-222-2222')
puts "*********************** Completed Where ***************************"

puts "Entry not"
puts Entry.not(phone_number: '999-999-9999')
puts "************************ Completed Not ****************************"