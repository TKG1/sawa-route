require 'rails_helper'

RSpec.describe 'Admin::Users', type: :system do
  describe 'user CRUD' do
    let(:admin_user) { create(:user, :admin) }
    let!(:other_user) { create(:user) }

    before do
      login_as(admin_user)
      visit admin_root_path
      click_link 'ユーザー'
    end

    it 'displays user list' do
      expect(page).to have_selector "#user_#{admin_user.id}"
      expect(page).to have_selector "#user_#{other_user.id}"
      expect(current_path).to eq admin_users_path
    end

    it "displays a user's detailed data" do
      within "#user_#{other_user.id}" do
        click_link '閲覧'
      end
      expect(page).to have_content other_user.name
      expect(page).to have_content other_user.email
      expect(page).to have_content other_user.role
      expect(page).to have_content other_user.avatar
      expect(current_path).to eq admin_user_path(other_user)
    end

    it 'creats a new user' do
      click_link 'ユーザー を作成する'
      fill_in 'user_name', with: 'tester'
      fill_in 'user_email', with: 'tester@test.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'ユーザーを作成'

      new_user = User.last
      expect(page).to have_content 'ユーザーを登録しました'
      expect(page).to have_content 'tester'
      expect(page).to have_content 'tester@test.com'
      expect(current_path).to eq admin_user_path(new_user)
    end

    it 'updates a user' do
      within "tr#user_#{other_user.id}" do
        click_link '編集'
      end
      fill_in 'user_name', with: 'tester'
      fill_in 'user_email', with: 'tester@test.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'ユーザーを更新'

      expect(page).to have_content 'ユーザーを更新しました'
      expect(page).to have_content 'tester'
      expect(page).to have_content 'tester@test.com'
      expect(current_path).to eq admin_user_path(other_user)
    end

    it 'destroys a user' do
      within "tr#user_#{other_user.id}" do
        accept_alert { click_link '削除' }
      end
      expect(page).to have_content 'ユーザーを削除しました'
      expect(current_path).to eq admin_users_path
    end
  end
end
