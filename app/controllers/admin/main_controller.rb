class Admin::MainController < Admin::ApplicationController
	
  layout 'admin'
  def index
  	@countDoc = Document.all.count
  	@docs = Document.order("created_at DESC").first(5)

  	@countNews = Article.all.count
  	@news = Article.published.first(5)

  	@countVideo=VideoFile.count
	@countRmi = FaqRmisAnswer.count
	@countDeps = Department.count
	@countEmpls = Employee.count

  end
end
