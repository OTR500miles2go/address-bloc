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

puts Entry.destroy_all("phone_number = '111-111-1111'")

puts "\nDeleted item(s):"
puts Entry.where(name: "Elaine Denise").destroy_all
puts Entry.where(phone_number: "111-111-1111").destroy_all
puts Entry.where(phone_number: "100-200-3000").destroy_all
puts Entry.where(phone_number: "222-222-2222").destroy_all
puts Entry.where(phone_number: "999-999-9999").destroy_all
puts Entry.where(phone_number: "123-456-7890").destroy_all
puts Entry.where(phone_number: "400-500-6000").destroy_all
