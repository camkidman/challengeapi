class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::ImplicitRender

  before_action :set_default_response_format

  protected

  def set_default_response_format
    request.format = :json
  end

end
