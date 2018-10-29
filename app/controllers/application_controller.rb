class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
    
    private
  
    def curent_user
      @curent_user ||= User.find_by(user_token: request.headers["user_token"])
    end
  
    def auth_user
      render json: {error: 'unauthorized'}, status: 401 if !curent_user
    end

end
