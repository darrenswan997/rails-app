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
 
  #   def optimized_image(image,x,y)
  #    return image.variant(resize_to_fill: [x, y]).processed
  #  end

  newsapi = News.new("c0609dca0c634fcc91e201434ce569e1")             

# /v2/top-headlines
top_headlines = newsapi.get_top_headlines(q: 'corona',
                                          language: 'en',
                                          country: 'ie')

# /v2/everything
all_articles = newsapi.get_everything(q: 'news',
                                      sources: 'bbc-news,the-verge',
                                      domains: 'bbc.co.uk,techcrunch.com',
                                      from: '2020-03-20',
                                      language: 'en',
                                      sortBy: 'relevancy',
                                      page: 2)

# /v2/sources
sources = newsapi.get_sources(country: 'ie', language: 'en')
    # Init

  def fetch_news_query query
    url = "https://newsapi.org/v2/everything?q=#{query}&apiKey=#{ENV['newsapi']}&language=en"
    response = HTTParty.get(url)
    response.parsed_response['link'] unless response.code != 200
  end
    
  
end
