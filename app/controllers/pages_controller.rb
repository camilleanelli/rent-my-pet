class PagesController < ApplicationController

  def home
    @cats = Cat.all
  end

  def dashboard

    @cats = current_user.cats.all
  end

end
