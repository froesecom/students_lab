class Student
  attr_accessor :name, :bio, :photo, :facebook, :twitter, :git

  def initialize(name, bio, photo, facebook, twitter, git)
    # name = string
    # bio = string
    # photo = url (on the web)
    # facebook = url
    # twitter = url
    # git = url
    @name = name
    @bio = bio
    @photo = photo
    @facebook = facebook
    @twitter = twitter
    @git = git
  end

end



