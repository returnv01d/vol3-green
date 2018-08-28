class Catering::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :description, :city])
    permit(:account_update, keys: [:name, :description, :city])
  end
end