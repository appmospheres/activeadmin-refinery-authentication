Refinery::ApplicationController.module_eval do
  private
  def authorisation_manager
    refinery_authorisation_manager
  end
end
