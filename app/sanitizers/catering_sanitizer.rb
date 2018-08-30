class Catering::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :description, :city, :food_order_close_time])
    permit(:account_update, keys: [:name, :description, :city, :food_order_close_time])
  end
end