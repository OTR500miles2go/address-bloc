require_relative 'controllers/menu_controller'

menu = MenuController.new

system "clear"

puts "\n\n\tWelcome to Address-Bloc!\n\n"

menu.main_menu
