RSpec.shared_context 'When authenticated' do
  before :each do
  	User.create(email: 'user@example.com', password: 'caplin')
    authenticate
  end

  def authenticate
    visit '/users/sign_in'
    within('form#new_user') do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Пароль', :with => 'caplin'
    end
    click_button 'Войти'
  end
end