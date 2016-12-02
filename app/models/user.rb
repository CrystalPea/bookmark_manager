require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :cryptpass, Text

  def password=(password)
    self.cryptpass = BCrypt::Password.create(password)
  end
end
