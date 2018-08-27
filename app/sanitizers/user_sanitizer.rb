class User::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:first_name, :last_name, :city])
    permit(:account_update, keys: [:first_name, :last_name, :city])
  end
end