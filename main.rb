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

  @students = {
    :nix => Student.new("Nix Siow",
      "<p>I not a good talker but I am good listener everytime. Love to explore new stuff, learn new languages and cultures by traveling. I always think that if you want something to change, you have to do something different, it works every single time. I love cosmos stuff, weird stuff and music ! ROCK! You will know me better if you know me long enough. ;) cheers!</p>",
      "https://fbcdn-sphotos-b-a.akamaihd.net/hphotos-ak-prn2/t31/964256_10151526505642885_2142134270_o.jpg",
      "http://www.facebook.com/nixsiow.yk",
      "http://www.twitter.com/nixsiow",
      "https://github.com/nixsiow"),
    :olly => Student.new("Olly Dutton",
      "<p>I don’t like cow’s udders at all. I was forced to milk a cow on a school trip when I was at a very young and tender age.</p><p>I’ve had a phobia of udders ever since. Other than that, and various OCD qwerks I’m not too bad.</p>",
      "http://i764.photobucket.com/albums/xx283/ollydutton/ollyimage_zpsea4c08ad.jpg",
      "https://www.facebook.com/olly.dutton",
      "https://twitter.com/hacks_n_stacks",
      "https://github.com/ollyd"),
    :charlie => Student.new("Charlie",
      "<p>Charlie was born in Osaka, Japan. As a child, she trained with the Dark Shadows, a league of ninjas whose mission it is to uphold the honour of upstanding Japanese citizens.</p><p> At 18, she was given a secret mission to infiltrate the Nakazaki Black souls: an class of underworld criminals.</p> ",
      "https://pbs.twimg.com/profile_images/440808125721870336/34QLtMdA.jpeg",
      "http://www.twitter.com/charlie__gerard",
      "https://www.facebook.com/annecharlottegerard",
      "http://www.github.com/charliegerard"),
    :simon => Student.new("Simon Taylor",
      "<p>I'm 29 years old and my hobbies include watching movies and tv, playing video games, card games and board games, and also watching soccer (Liverpool in particuluar!) and the UFC.</p><p> My love for card and board games extends beyond just playing them and I've recently joined my friends company 93 Made Games as the Director of IT where I'll be designing and hopefully publishing our own games and also revamping the company website.</p><p>I've been an avid computer user for the past 16 years and this lead me to study Computer Science at University. However after first year I made the decision to change to an informations systems degree instead which is aimed at Business Analysts / Project Managers. This is a decision I have come to regret and have wished to get back into programming for a number of years.</p><p>A friend of mine who I worked with previously suggested I should pursue web development as this is the future of the industry. I did my research and found General Assembly and decided to do the Back End Web Development course. After completing this late last year I decided this is what I want to do for my career, quit my job and signed up for the WDI and here I am now!</p>",
      "http://s28.postimg.org/kxgksbwwd/photo.jpg",
      "https://www.facebook.com/simon.taylor.3139",
      "https://twitter.com/SimonTaylorAU",
      "https://github.com/nizmox"),
    :erik => Student.new("Erik Froese",
      "<p>Erik Froese is a chicken giblet reader from Western Canada. His father is a grizzly bear and his mother a champion squash player. Erik grew up in a termite mound and enjoyed playing basketball as a child.</p><p>At the age of 14, he took up drinking, which eventually led him to Melbourne, where he met his future wife. They now have two children, and a witchetty grub named Jim.</p><p> Erik plans on reading chicken entrails to predict changes in the stock market, so he can make it rich. He will use his new-found wealth to build the world’s largest potato gun, from which he will launch himself and 5000 of his closets friends into space. They will colonise Mars.</p>",
      "http://i.imgur.com/VzzXBuQ.jpg",
      "http://www.facebook.com/TheRealFroese",
      "http://www.twitter.com/EAFroese",
      "https://github.com/froesecom")
  }

  @student = @students[params[:name].to_sym]
  if @student == nil 
    erb :error
  else
    erb :student
  end

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

not_found do
  status 404
  erb :error
end