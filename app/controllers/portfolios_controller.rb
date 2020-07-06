class PortfoliosController < ApplicationController

	def index
		@portfolios = Portfolio.all
	end

  def angular
    @angular_portfolios = Portfolio.angular
  end

	def new
		@portfolio = Portfolio.new
    3.times { @portfolio.technologies.build }
	end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

	def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title,:subtitle,:body,technologies_attribbutes: [:name]))

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio is successfully created.' }
        # format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end 

  def edit
  	@portfolio = Portfolio.find(params[:id])
  end

  def update
  	@portfolio = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio.update(params.require(:portfolio).permit(:title,:subtitle,:body))
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
        # format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end
end
