class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource_or_scope)
    choose_preferences_path
  end
end
