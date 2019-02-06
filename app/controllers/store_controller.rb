class StoreController < ApplicationController
  def index
    @products = Product.order(popularity: :desc)
    if session[:counter] == nil
      session[:counter] = 0
    
    else
        session[:counter] += 1

        if session[:counter] > 5
          flash.now[:index] = "You have visited the page #{session[:counter]} times".pluralize{session[:counter]} + " without buying anything"      
        end
    end

    respond_to do |format|
      format.html {
          if (params[:spa] && params[:spa] == "true")
              render 'index_spa'
          # the else case below is by default
          else
              render 'index'
          end
      }
      format.json {render json: @products}
    end
  end
end
