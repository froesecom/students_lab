class Student
  attr_accessor :name, :bio, :photo, :facebook, :twitter, :git

  def initialize(name, bio, photo, facebook, twitter, git)
    # name = string
    # bio = string
    # photo = url (on the web)
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