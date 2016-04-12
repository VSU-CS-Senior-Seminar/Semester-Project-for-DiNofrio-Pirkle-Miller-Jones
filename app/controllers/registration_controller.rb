class RegistrationsController < Devise::RegistrationsController
    
private

  def sign_up_params
    params.require(:user).permit(:name, :zipcode, :email, :password, :password_confirmation, :role, :likes )
  end
  
  
end
