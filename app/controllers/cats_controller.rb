class CatsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_cats, only: [:show, :edit, :update, :destroy]

  def index
    @cats = Cat.all
  end

  def show
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

  end

  private

  def set_cats
    @cat = Cat.find(params[:id])
  end

  def params_cats
    params.require(:cat).permit(:name, :description, :price, :gender, :race, :age, :zip_code, :city, :address)
  end

end
