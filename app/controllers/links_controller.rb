class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :fetch_news, only: [:index]
  require 'news-api'
  require 'open-uri'
  # GET /links
  # GET /links.json
  def index
    

     @links = Link.all.order("created_at DESC").paginate(page: params[:page])
     if params[:search]
      @search_term = params[:search]
      @links = @links.search_by(@search_term)
    end
    # placeholder for images that do not exist
    @image_placeholder = 'https://placehold.it/50x50'
    @articles ||= []

  end

  def articles
    require 'news-api'

    newsapi = News.new("c0609dca0c634fcc91e201434ce569e1")             

# /v2/top-headlines
top_headlines = newsapi.get_top_headlines(q: 'corona',
                                          language: 'en',
                                          country: 'ie')

# /v2/everything
all_articles = newsapi.get_everything(q: 'news',
                                      sources: 'bbc-news,the-verge',
                                      domains: 'bbc.co.uk,techcrunch.com',
                                      from: '2020-03-28',
                                      language: 'en',
                                      sortBy: 'relevancy',
                                      page: 2)

# /v2/sources
sources = newsapi.get_sources(country: 'ie', language: 'en')
    # Init
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @comment = Comment.new
    @comments = @link.comments
    

    @link.views ||= 0
    @link.update(views: @link.views + 1)
    
   
    @image_placeholder = 'https://placehold.it/50x50'
  query = params[:q]
  @articles = fetch_news_query query unless !query
  @articles ||= [] # empty array if no query
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  def news
    @image_placeholder = 'https://placehold.it/50x50'
    query = params[:q]
    @articles = fetch_news_query query unless !query
    @articles ||= [] # empty array if no query

    newsapi = News.new("c0609dca0c634fcc91e201434ce569e1")             

    # /v2/top-headlines
    top_headlines = newsapi.get_top_headlines(q: 'news',
                                              language: 'en',
                                              country: 'ie')
    
   

  end


  def search
    # Get /links/search
  #@links = Link.where("title LIKE ?", params[:q])
  @image_placeholder = 'https://placehold.it/50x50'
  query = params[:q]
  @articles = fetch_news_query query unless !query
  @articles ||= [] # empty array if no query
end
  

  # GET /links/1/edit
  def edit
    @link.user = current_user
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    @link.user = current_user #setting the link to the current user logged in
    respond_to do |format|
      if @link.save
        format.html { redirect_to @link, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id]) 
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:title, :id, :url, :search, :views, :body, :thumbnail, :banner)
    end

     def fetch_news_query query
       url = "https://newsapi.org/v2/top-headlines?country=ie&apiKey=c0609dca0c634fcc91e201434ce569e1"
       response = HTTParty.get url
       response.parsed_response['articles'] unless response.code != 200
     end

    

end
