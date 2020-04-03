class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  require 'news-api'
   # Active Storage from Rails 5
   has_one_attached :thumbnail
   has_one_attached :banner
   # Action Text from Rails 6
   has_rich_text :body
 
   validates :title, length: { minimum: 5 }
   validates :body,  length: { minimum: 25 }
 
  def self.search_by(search_term)
      where("LOWER(title) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end


   self.per_page = 10;
 
  
  def fetch_news_query query
    url = "https://newsapi.org/v2/everything?q=#{query}&apiKey=#{ENV['newsapi']}&language=en"
    response = HTTParty.get(url)
    response.parsed_response['link'] unless response.code != 200
  end
    
  
end
