require 'rails_helper'

RSpec.describe 'Admin::Maps', type: :system do
  describe 'map CRUD' do
    let(:admin_user) { create(:user, :admin) }
    let!(:map) { create(:map) }

    before do
      login_as(admin_user)
      visit admin_root_path
      click_link 'マップ'
    end

    it 'displays map list' do
      expect(page).to have_selector "#map_#{map.id}"
      expect(current_path).to eq admin_maps_path
    end

    it "displays a map's detailed data" do
      within "#map_#{map.id}" do
        click_link '閲覧'
      end
      expect(page).to have_content map.latitude
      expect(page).to have_content map.longitude
      expect(current_path).to eq admin_map_path(map)
    end

    it 'creats a new map' do
      click_link 'マップ を作成する'
      find("option[value='#{map.route.id}']").select_option
      fill_in 'map_latitude', with: 85.11111
      fill_in 'map_longitude', with: 100.14524
      click_button 'マップを作成'

      new_map = Map.last
      expect(page).to have_content 'マップを登録しました'
      expect(page).to have_content '85.11111'
      expect(page).to have_content '100.14524'
      expect(current_path).to eq admin_map_path(new_map)
    end

    it 'updates a map' do
      within "tr#map_#{map.id}" do
        click_link '編集'
      end

      find("option[value='#{map.route.id}']").select_option
      fill_in 'map_latitude', with: 38.11111
      fill_in 'map_longitude', with: 34.14524
      click_button 'マップを更新'

      expect(page).to have_content 'マップを更新しました'
      expect(page).to have_content '38.11111'
      expect(page).to have_content '34.14524'
      expect(current_path).to eq admin_map_path(map)
    end

    it 'destroys a map' do
      within "tr#map_#{map.id}" do
        accept_alert { click_link '削除' }
      end
      expect(page).to have_content 'マップを削除しました'
      expect(current_path).to eq admin_maps_path
    end
  end
end
