class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def pdf_with_redirect
    redirect_to to_path url: Learn::Pdf.print(url_for params.merge format: :html)
  end
end
