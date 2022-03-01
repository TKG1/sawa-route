require 'rails_helper'

RSpec.describe 'Admin::UserSessions', type: :system do
  let(:general_user) { create(:user) }
  let(:admin_user) { create(:user, :admin) }
  let(:route) { create(:route) }
  let(:map) { create(:map, route_id: route.id) }

  describe 'before login' do
    context 'when access to admin page' do
      it 'redirects to root path' do
        visit admin_root_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path

        visit admin_maps_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit new_admin_map_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit edit_admin_map_path(map)
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit admin_map_path(map)
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path

        visit admin_mountains_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit new_admin_mountain_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit edit_admin_mountain_path(route.mountain)
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit admin_mountain_path(route.mountain)
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path

        visit admin_users_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit new_admin_user_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit edit_admin_user_path(general_user)
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit admin_user_path(general_user)
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path

        visit admin_prefectures_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit new_admin_prefecture_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit edit_admin_prefecture_path(route.mountain.prefecture)
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
        visit admin_prefecture_path(route.mountain.prefecture)
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
      end
    end
  end

  # ログイン後
  describe 'after login' do
    context 'when a general user' do
      before { login_as(general_user) }

      it 'redirects to root path' do
        visit admin_root_path
        expect(page).to have_content '権限がありません'
        expect(current_path).to eq root_path
      end
    end

    context 'when a admin user' do
      it 'logins with a admin user' do
        visit login_path
        within('form#login') do
          fill_in 'email', with: admin_user.email
          fill_in 'password', with: 'password'
          click_button 'ログイン'
        end
        expect(page).to have_content 'ログインしました'
        expect(current_path).to eq root_path
      end

      it 'access a admin page' do
        login_as(admin_user)
        visit admin_root_path
        expect(page).to have_content 'ダッシュボード'
        expect(current_path).to eq admin_root_path
      end

      it 'access a admin page' do
        login_as(admin_user)
        visit admin_root_path
        within '#logout' do
          click_link 'ログアウト'
        end
        expect(page).to have_content 'ログアウトしました'
        expect(current_path).to eq root_path
      end
    end
  end
end
