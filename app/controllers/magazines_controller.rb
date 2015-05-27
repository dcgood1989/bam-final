class MagazinesController < ApplicationController

  def index
    @magazines = Magazine.all
  end

  def new
    @magazine = Magazine.new
  end

  def create
    @magazine = Magazine.new(magazine_params)
    if @magazine.save
      flash[:notice] = "#{@magazine.title} Edition #{@magazine.edition} Successfully Added"
      redirect_to magazine_path(@magazine)
    else
      flash[:notice] = "Unable to save magazine. Please fill out every field"
      render :new
    end
  end

  def show
    @magazine = Magazine.find(params[:id])
  end

  def edit
    @magazine = Magazine.find(params[:id])
  end

  def update
    @magazine = Magazine.find(params[:id])
    if @magazine.update(magazine_params)
      flash[:notice] = "Updated successfully"
      redirect_to magazine_path(@magazine)
    else
      flash[:notice] = "Something went wrong"
      render :edit
    end
  end

  def destroy
    @magazine = Magazine.find(params[:id])
    @magazine.destroy
    flash[:notice] = "Magazine deleted successfully"
    redirect_to "/"
  end

  def magazine_params
    params.require(:magazine).permit(:title, :edition, :issue, :language)
  end
end
