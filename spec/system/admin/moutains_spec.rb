require 'rails_helper'

RSpec.describe 'Admin::Mountains', type: :system do
  describe 'mountain CRUD' do
    let(:admin_user) { create(:user, :admin) }
    let!(:mountain) { create(:mountain) }

    before do
      login_as(admin_user)
      visit admin_root_path
      click_link '山'
    end

    it 'displays mountain list' do
      expect(page).to have_selector "#mountain_#{mountain.id}"
      expect(current_path).to eq admin_mountains_path
    end

    it "displays a mountain's detailed data" do
      within "#mountain_#{mountain.id}" do
        click_link '閲覧'
      end
      expect(page).to have_content mountain.name
      expect(current_path).to eq admin_mountain_path(mountain)
    end

    it 'creats a new mountain' do
      click_link '山 を作成する'
      find("option[value='#{mountain.prefecture.id}']").select_option
      fill_in 'mountain_name', with: '富士山'
      click_button '山を作成'

      new_mountain = Mountain.last
      expect(page).to have_content '山を登録しました'
      expect(page).to have_content '富士山'
      expect(current_path).to eq admin_mountain_path(new_mountain)
    end

    it 'updates a mountain' do
      within "tr#mountain_#{mountain.id}" do
        click_link '編集'
      end

      find("option[value='#{mountain.prefecture.id}']").select_option
      fill_in 'mountain_name', with: '立山'
      click_button '山を更新'

      expect(page).to have_content '山を更新しました'
      expect(page).to have_content '立山'
      expect(current_path).to eq admin_mountain_path(mountain)
    end

    it 'destroys a mountain' do
      within "tr#mountain_#{mountain.id}" do
        accept_alert { click_link '削除' }
      end
      expect(page).to have_content '山を削除しました'
      expect(current_path).to eq admin_mountains_path
    end
  end
end
