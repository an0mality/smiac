class MainController < ApplicationController



  def index
    # @articles=Article.published.select(:id, :title, :count_views, :image_file_name, :created_at).last(4).to_json
    @articles=Article.published.first(3)

    # RSS поток с последними 3 новостями rosminzdrav.ru
    require "rss"
    require "open-uri"
    require 'net/http'
    url = 'https://www.rosminzdrav.ru/news.atom'
    begin
      @rss_results = []
      open(url) do |rss|
        feed = RSS::Parser.parse(rss)
        feed.items[0..3].each do |item|
          result = { title: item.title.content, date: item.published.content, link: item.link.href, description: item.content.content }
          @rss_results.push(result)
        end
        @rss_results

      end
    rescue
    end


  end

  def global_search
    if params[:search].present?
      @articles_gl = Article.search_gl params
      @orgs = Organization.search params
      @departs = Department.search params
      @docs = Document.search_glob params
      @employees = Employee.search params
      @fras = FaqRmisAnswer.search params
      @videos = VideoFile.search params
      # @articles = Searchkick.search(params[:search], index_name: [Article.searchkick_index.name, FaqRmisAnswer.searchkick_index.name])
    else
      redirect_to root_path

    end
  end

  def sitemap
  respond_to do |format|
    format.xml { render file: 'public/sitemap.xml' }
    format.html 
    # { redirect_to root_url }
  end
end


end
