class ArticlesController < ApplicationController

  before_action :set_article, only: [:destroy,:show,:edit,:update]

  def index
  	@articles = Article.all
  	@article = Article.new
    @groups = Group.all
  end

  def new
  	@article = Article.new
  	respond_to do |format|
  		format.html
  		format.xml {render xml: @article}
  		format.json {render json: @article}
  	end
  end

  def create
  	@article = Article.new(article_param)
  	
  	respond_to do |format|
  		if @article.save
  			format.html { redirect_to @article, notice: "Exitoso"}
  			format.js {}
	  	else
	  		render :new
	  	end
  	end
  end

  def show

  end


  def edit
  	respond_to do |format|
  		format.html {}
  		format.js {}
  	end
  end 

  def update
  	if @article.update(article_param)
  		redirect_to @article
  	else
  		render :edit
  	end
  end	

  def destroy
  	@article.destroy
  	redirect_to articles_path
  end


  private

  def article_param
  	params.require(:article).permit(:title,:body)
  end

  def set_article
  	@article = Article.find(params[:id])
  end

end
