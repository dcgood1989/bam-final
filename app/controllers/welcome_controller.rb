class WelcomeController < ApplicationController

  def index
    @magazines = Magazine.all
  end
end
