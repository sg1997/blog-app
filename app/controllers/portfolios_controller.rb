class PortfoliosController < ApplicationController

	def index
		@portfolios = Portfolio.all
	end

	def new
		@portfolio = Portfolio.new
	end

	def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title,:subtitle,:body))

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
end
