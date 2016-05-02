class ApplicationController < ActionController::Base
 
  
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
    

  def pundit_user
    current_artist
  end

  
  def after_sign_in_path_for(resource)
    if resource.sign_in_count == 1
         principal_path 
    elsif resource.admin?
        admin_index_path
    else
         principal_path
    end
   end

   def after_sign_out_path_for(resource)
      root_path
   end



  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      flash[:alert] = "Você não possui autorização para acessar este painel!"
      redirect_to(request.referrer || artist_datas_path)
    end


    

end
