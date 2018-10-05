require 'httparty'
require 'json'
require 'pry'

response = HTTParty.get('http://json-server.devpointlabs.com/api/v1/users')
@res = JSON response

def menu
  puts `clear`
  puts "=================================="
  puts "              USERS               "
  puts "=================================="
  puts @res
  puts 
  puts "1.) Show specific user."
  puts "2.) Add users."
  puts "3.) Exit"
  user_choice
end

def user_choice
  user_choice = gets.strip
  if user_choice == '1'
    puts
    puts "Which user would you like to view?"
    puts "Enter user ID."
    id = gets.strip.to_i
    showUser = HTTParty.get("http://json-server.devpointlabs.com/api/v1/users/#{id}")
    puts "=================================="
    puts "         VIEW USER BELOW          "
    puts "=================================="
    puts showUser
    puts 
  elsif user_choice == '2'
    puts
    puts "=================================="
    puts "            ADD USER              "
    puts "=================================="
    puts
    puts "Enter the users FIRST name."
    puts
    firstname = gets.strip
    puts
    puts "Enter the users LAST name."
    puts
    lastname = gets.strip
    puts
    puts "Enter the users phone number using"
    puts "numbers only -- inlclude zip code."
    phonenumber = gets.strip.to_i
    HTTParty.put("http://json-server.devpointlabs.com/api/v1/users/#{id}?user=[first_name]=#{firstname}&user[last_name]=#{lastname}&user[phone_number]=#{phonenumber}")
    puts "Thank you. User has been added. "
  elsif user_choice == '3'
    puts
    puts "=================================="
    puts "      Thanks, see you later!"
    puts "=================================="
    EXIT
  else
    puts "Invalid choice."
  end
end

menu
