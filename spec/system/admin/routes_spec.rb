require 'rails_helper'

RSpec.describe 'Admin::Routes', type: :system do
  describe 'route CRUD' do
    let(:admin_user) { create(:user, :admin) }
    let!(:route) { create(:route) }

    before do
      login_as(admin_user)
      visit admin_root_path
      click_link 'ルート'
    end

    it 'displays route list' do
      expect(page).to have_selector "#route_#{route.id}"
      expect(current_path).to eq admin_routes_path
    end

    it "displays a route's detailed data" do
      within "#route_#{route.id}" do
        click_link '閲覧'
      end
      expect(page).to have_content route.name
      expect(page).to have_content route.schedule
      expect(page).to have_content route.level
      expect(page).to have_content route.time
      expect(page).to have_content route.length
      expect(current_path).to eq admin_route_path(route)
    end

    it 'creats a new route' do
      click_link 'ルート を作成する'
      find("option[value='#{route.mountain.id}']").select_option
      fill_in 'route_name', with: 'test_route'
      fill_in 'route_description', with: 'test_route_description'
      fill_in 'route_time', with: '08:44'
      fill_in 'route_length', with: 10
      click_button 'ルートを作成'

      new_route = Route.last
      expect(page).to have_content 'ルートを登録しました'
      expect(page).to have_content 'test_route'
      expect(page).to have_content 'test_route_description'
      expect(page).to have_content '08:44'
      expect(page).to have_content 'one_day'
      expect(page).to have_content 'grade1'
      expect(page).to have_content 10
      expect(current_path).to eq admin_route_path(new_route)
    end

    it 'updates a route' do
      within "tr#route_#{route.id}" do
        click_link '編集'
      end

      find("option[value='#{route.mountain.id}']").select_option
      fill_in 'route_name', with: 'test_route'
      fill_in 'route_description', with: 'test_route_description'
      select 'Two days', from: '予定'
      select 'Grade2', from: 'グレード'
      fill_in 'route_time', with: '08:44'
      fill_in 'route_length', with: 10
      click_button 'ルートを更新'

      expect(page).to have_content 'ルートを更新しました'
      expect(page).to have_content 'test_route'
      expect(page).to have_content 'test_route_description'
      expect(page).to have_content '08:44'
      expect(page).to have_content 'two_days'
      expect(page).to have_content 'grade2'
      expect(page).to have_content 10
      expect(current_path).to eq admin_route_path(route)
    end

    it 'destroys a route' do
      within "tr#route_#{route.id}" do
        accept_alert { click_link '削除' }
      end
      expect(page).to have_content 'ルートを削除しました'
      expect(current_path).to eq admin_routes_path
    end
  end
end
