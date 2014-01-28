module ControllerMacros
  def login_user(user = nil)
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      if user.nil?
        user = Fabricate(:user)
      end
      sign_in user
    end
  end
end
