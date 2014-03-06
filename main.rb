require 'pry'
require 'sinatra'
require 'sinatra/reloader'

require 'pony'

require_relative 'students'

get '/' do
  erb :home
end

get '/about' do
  erb :about
end

get '/student/:name' do
  @student = @students[params[:name]]
  erb :student
end

get '/contact' do
  erb :contact
end

post '/contact' do
  #Parameters available from form
  #params[:name] params[:email_address] params[:message]

  subject = "Thanks for your email - Students Lab Team"
  message = "Hi #{ params[:name] },\nThankyou for contacting us, we will endeavour to get back to you as soon as possible!\nRegards, The Students Lab Team"

  puts "-----------"
  puts "EMAIL SENT!"
  puts "To: #{ params[:email_address]}"
  puts "Subject: #{ subject }"
  puts "Body: #{ message }"
  puts "-----------"

  Pony.mail(:to => params[:email_address], :from => 'team@studentlabs.com', :subject => subject, :body => message)
  erb :thanks
end