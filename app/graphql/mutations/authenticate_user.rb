class Mutations::AuthenticateUser < Mutations::BaseMutation
  null true

  argument :email, String, required: true
  argument :password, String, required: true


  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(args)
    user = User.find_by(email: args[:email])
    if user && user.authenticate(args[:password])
      {user: user, errors: []}
    else
      {user: nil, errors: ["invalid email/password combination."] }
    end
  end
end