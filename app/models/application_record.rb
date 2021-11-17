class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  before_commit :authenticate_user!
  before_commit :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nicname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday])
  end
end