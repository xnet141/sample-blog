class ArticlesController < ApplicationController
  before_action :authenticate_user!, :only => [ :index, :new, :edit, :create, :destroy ]

	def index
		@articles = Article.all
    
    # user = User.find(curre  @user = User.find(params[:user_id])nt_user.id)
    # @articles = user.articles.all
	end

	def show    
    @article = Article.find(params[:id])
    @test = params[:title]
		# user = User.find(current_user.id)
    # @article = user.articles.find(params[:id])
	end

	def new
	end

  def create
    user = User.find(current_user.id)
    @article = user.articles.new(article_params)

  	#@article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end	

  def edit
  	@article = Article.find(params[:id])
    
	end

	def update
		@article = Article.find(params[:id])
    
    # if @article.user_id != current_user.id
    #   get_variable ("nono") 
    #   return render :edit
    # end  

		if @article.user_id == current_user.id && @article.update(article_params) 
      redirect_to @article
    else
      #redirect_to @article
      render action: 'edit'
    end

	end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy 
    
    redirect_to articles_path  
  end

  private

  def article_params
    #params[:user_id] = current_user.id
    params.require(:article).permit(:title, :text) #user_id
  end


end

