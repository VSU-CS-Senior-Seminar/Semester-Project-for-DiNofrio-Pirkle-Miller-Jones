class RegistrationController < Devise::RegistrationController
    
private

  def sign_up_params
    params.require(:user).permit(:first_name, :zipcode, :email, :password, :password_confirmation)
  end
  
  
end
