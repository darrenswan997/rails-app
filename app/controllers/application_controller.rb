class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception
 before_action :authenticate_user!

  def fetch_news
     url = "https://newsapi.org/v2/top-headlines?country=ie&apiKey=#{ENV['NEWS_API_KEY']}"
     response = HTTParty.get url
     @articles = response.parsed_response['articles'] unless response.code != 200
   end
 
end
