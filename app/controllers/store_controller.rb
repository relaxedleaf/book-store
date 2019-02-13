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
      format.json {render json: Product.order(sort_by + ' ' + order)}
    end
  end

  private 
    def sort_by
       %w(title
          price
          popularity).include?(params[:sort_by]) ? params[:sort_by] : 'popularity'
    end
    def order
       %w(asc desc).include?(params[:order]) ? params[:order] : 'asc'
    end
end
