class HomeController < ApplicationController
  def show
  end

  def fav_language
    @lang = GithubApi::V4::User.new(params[:git_username]).favorite_language
  rescue GithubApi::V4::QueryExecutionError => e
    @error_message = e.message
    render :alert_error
  end
end
