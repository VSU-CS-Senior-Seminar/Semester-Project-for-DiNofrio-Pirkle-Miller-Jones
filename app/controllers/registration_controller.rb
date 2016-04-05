class RegistrationController < Devise::RegistrationController
    
private

  def sign_up_params
    params.require(:user).permit(:name, :zipcode, :email, :password, :password_confirmation, :role )
  end
  
  
end
