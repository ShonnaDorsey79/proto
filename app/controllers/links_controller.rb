class LinksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @link = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end
  
  def update
    @link = Link.find(params[:id])
    
    if @link.update(link_params)
      redirect_to @link
    else
      render :edit
    end
  end
  

  def create
    @link = Link.new(link_params)
    
    if @link.save
      redirect_to @link
    else
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new
    @link = Link.new
  end
  
  private 
  def link_params
    params.require(:link).permit(:title, :url, :notes)
  end
  
end
