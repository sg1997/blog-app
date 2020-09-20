class PortfoliosController < ApplicationController
  layout 'portfolio'
  access all: [:show,:index,:angular],user: { except: [:destroy,:edit,:create,:update,:new] },site_admin: :all 
	def index
		@portfolios = Portfolio.by_position
	end

  def angular
    @angular_portfolios = Portfolio.angular
  end

	def new
		@portfolio = Portfolio.new
    @portfolio.technologies.build
	end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

	def create
    @portfolio = Portfolio.new(portfolio_params)
    byebug
    @portfolio.main_image = params[:portfolio][:main_image]
    @portfolio.thumb_image = params[:portfolio][:thumb_image]

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
    3.times { @portfolio.technologies.build }
  end

  def update
  	@portfolio = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio.update(portfolio_params)
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

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,:subtitle, :thumb_image, :main_image,:body,technologies_attributes: [:id,:name,:_destroy]) 
  end
end
