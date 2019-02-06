class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    if session[:counter] == nil
      session[:counter] = 0
    
    else
        session[:counter] += 1

        if session[:counter] > 5
          flash.now[:index] = "You have visited the page #{session[:counter]} times".pluralize{session[:counter]} + " without buying anything"
          render :index
        
        end
      end
    end
  end
