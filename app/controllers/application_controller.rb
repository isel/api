class ApplicationController < ActionController::Base
  protect_from_forgery

  def return_formatted(object)
    respond_to do |format|
      format.html
      format.json { render json: object }
      format.xml { render xml: object }
    end
  end

end
