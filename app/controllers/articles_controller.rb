class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json

  def index
    # @articles = Article.all
    # Pagination Implementation
    #loads default number of item per page (20 or 30)
    @articles = Article.paginate(page: params[:page], per_page: 2)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    #
    # id = params[:id].to_i
    # id = id -8
    # @article = Article.find(id)
     # @article = Article.find(params[:id])

  end

  # GET /articles/new
  def new
     @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create



    @article = Article.new(article_params)

# pansuman tedbir
     @article.user = User.first

    respond_to do |format|
      if @article.save

         format.html { redirect_to @article , notice: 'YESSSS !Article was successfully created.' }
          # format.html { redirect_to "https://www.google.com" , notice: 'YESSSS !Article was successfully created.' }
         # flash[:notice] = "HOPPALA"
        # format.html { redirect_to new_article_path, notice: 'YESSSS !Article was successfully created.' }
        # format.json { render :show, status: :created, location: @article }
        format.json { render :action => "show", status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      # format.html { redirect_to articles_url }
       format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description)

    end
end
