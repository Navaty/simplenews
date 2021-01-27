require 'rails_helper'

RSpec.feature "Posts", type: :feature, js: true do
 include_context 'When authenticated'

  scenario "Must exist title field" do
    visit '/posts/new'
    expect(page).to have_content 'Заголовок'
  end

  scenario "Create with correct attributes" do
    visit '/posts/new'
    within("div.first") do
      fill_in 'Заголовок', with: 'Some'
      fill_in 'Источник новости', with: 'Secret'
      fill_in 'URL источника', with: 'Secret'
    end
    click_button 'Следующий шаг'
    	within("div.second") do
	      fill_in 'Описание новости', with: 'Top secret'
	    end
	 click_button 'Следующий шаг'
	 within("div.third") do
	 	select "Авто", from: 'post[category]'
	 	#find('post[category]').find(:xpath, 'option[2]').select_option
	 end
		click_button 'Следующий шаг'
		expect(page).to have_content 'Новость успешно создана!'

  end
end
