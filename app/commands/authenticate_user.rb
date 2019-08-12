# app/commands/authenticate_user.rb

class AuthenticateUser
  prepend SimpleCommand

  def initialize(mobile, password)
    @mobile = mobile
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :mobile, :password

  def user
    user = User.find_by_mobile(mobile)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
