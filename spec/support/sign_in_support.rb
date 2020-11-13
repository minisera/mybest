module SignSupport
  def sign_in(user)
    visit new_user_sesion_path
    fill_in "Email",with: user.email
    fill_in "Password",with: user.password
    find("input[name="commit"]").click
    expect(current_path).to eq posts_path
  end
end