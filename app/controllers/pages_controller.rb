class PagesController < ApplicationController

  def home
    @cats = Cat.all
  end

  def dashboard

  end

end
