Devise::SessionsController.class_eval do
  skip_before_action :detect_activeadmin_sign_on!, only: [:create], raise: false
  after_action :detect_activeadmin_sign_on!, only: [:create]

  private
  def after_sign_in_path_for(resource)
    session["user_return_to"] || super
  end
end
