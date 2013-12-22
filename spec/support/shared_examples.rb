shared_examples "require_sign_in" do
  it "redirects unauthenticated user to the front page" do
    sign_out :user
    action
    expect(response).to redirect_to "/users/sign_in"
  end
end
