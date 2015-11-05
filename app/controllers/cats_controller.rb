class CatsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_cats, only: [:show, :edit, :update, :destroy]

  def index
    @cats = Cat.paginate(:page => params[:page], :per_page => 6)
    @markers = Gmaps4rails.build_markers(@cats) do |cat, marker|
      marker.lat cat.latitude
      marker.lng cat.longitude
    end
    if params[:search]
      @cats = Cat.search(params[:search]).order("created_at DESC")
    else
      @cats = Cat.all.order('created_at DESC')
    end
end




  def show
    @alert_message = "You are viewing #{@cat.name}"
    @cat_coordinates = [{ lat: @cat.latitude, lng: @cat.longitude }]
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(params_cats)
    if @cat.save
      redirect_to cat_path(@cat)
    else
       render :new
     end
  end

  def edit
    @cat.save
  end

  def update
    if @cat.update(params_cats)
      redirect_to cat_path(@cat)
    else
      render :edit
    end
  end

  def destroy
    if @cat.delete
      redirect_to cats_path
    else
      render :destroy
    end
  end

  private

  def set_cats
    @cat = Cat.find(params[:id])
  end

  def params_cats
    params.require(:cat).permit(:name, :description, :price, :gender, :race, :age, :zip_code, :city, :address, :picture)
  end

end
