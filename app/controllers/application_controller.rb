class ApplicationController < ActionController::Base
    
    private

    def find
        Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
        cart= Cart.create
        session[:cart_id] = cart.id
        cart
    end

    helper_method :find
end
