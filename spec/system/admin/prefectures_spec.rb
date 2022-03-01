require 'rails_helper'

RSpec.describe 'Admin::Prefectures', type: :system do
  describe 'prefecture CRUD' do
    let(:admin_user) { create(:user, :admin) }
    let!(:prefecture) { create(:prefecture) }

    before do
      login_as(admin_user)
      visit admin_root_path
      click_link '都道府県'
    end

    it 'displays prefecture list' do
      expect(page).to have_selector "#prefecture_#{prefecture.id}"
      expect(current_path).to eq admin_prefectures_path
    end

    it "displays a prefecture's detailed data" do
      within "#prefecture_#{prefecture.id}" do
        click_link '閲覧'
      end
      expect(page).to have_content prefecture.name
      expect(current_path).to eq admin_prefecture_path(prefecture)
    end

    it 'creats a new prefecture' do
      click_link '都道府県 を作成する'
      fill_in 'prefecture_name', with: '岐阜県'
      click_button '都道府県を作成'

      new_prefecture = Prefecture.last
      expect(page).to have_content '都道府県を登録しました'
      expect(page).to have_content '岐阜県'
      expect(current_path).to eq admin_prefecture_path(new_prefecture)
    end

    it 'updates a prefecture' do
      within "tr#prefecture_#{prefecture.id}" do
        click_link '編集'
      end

      fill_in 'prefecture_name', with: '長野県'
      click_button '都道府県を更新'

      expect(page).to have_content '都道府県を更新しました'
      expect(page).to have_content '長野県'
      expect(current_path).to eq admin_prefecture_path(prefecture)
    end

    it 'destroys a prefecture' do
      within "tr#prefecture_#{prefecture.id}" do
        accept_alert { click_link '削除' }
      end
      expect(page).to have_content '都道府県を削除しました'
      expect(current_path).to eq admin_prefectures_path
    end
  end
end
