class ApplicationController < ActionController::Base
  include Pundit
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  before_action :find_user
  helper_method :user_sign_in? , :current_user



  private

  def not_authorized
    redirect_to root_path, notice: '權限不足'
  end

  def find_user
    if session[:user_token]
      @current_user = User.find(session[:user_token])
    end
  end

  def not_found
    render file: '/public/404.html', status: 404,
    layout: false
  end


  def user_sign_in?
    current_user.present?
    #有值嗎
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_token])
  end

  def authenticate_user!
    redirect_to root_path, notice: "請登入會員" if not user_sign_in?
  end


end
