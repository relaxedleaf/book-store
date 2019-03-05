class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:type])
        end
        
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
