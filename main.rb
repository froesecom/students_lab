require 'pry'
require 'sinatra'
require 'sinatra/reloader'

class Student
  attr_accessor :name, :bio, :photo, :facebook, :twitter, :git

  def initialize(name, bio, photo, facebook, twitter, git)
    # name = string
    # bio = string
    # photo = url (on the wb)
    # facebook = url
    # twitter = url
    # git = url
  end

end

@students = {
  :nix => Student.new("Nix Siow","x","x","x","x","x"),
  :olly => Student.new("Olly","x","x","x","x","x"),
  :charlie => Student.new("Charlie","x","x","x","x","x"),
  :simon => Student.new("Simon","x","x","x","x","x"),
  :erik => Student.new("Erik","x","x","x","x","x")
}

get '/' do
  erb :home
end

get '/about' do
  erb :about
end

get '/student/:name' do
  erb :student
end

get '/contact' do
  erb :contact
end

post '/contact' do
  erb :thanks
end