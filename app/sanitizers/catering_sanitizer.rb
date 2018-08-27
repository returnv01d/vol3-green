class Catering::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :city])
    permit(:account_update, keys: [:name, :city])
  end
end