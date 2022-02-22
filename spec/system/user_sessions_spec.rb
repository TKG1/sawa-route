require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  let(:user) { create(:user) }

  describe 'before login' do
    before { visit login_path }

    context 'with a email, password' do
      it 'logins as a user' do
        within('form#login') do
          fill_in 'email', with: user.email
          fill_in 'password', with: 'password'
          click_button 'ログイン'
        end
        expect(page).to have_content 'ログインしました'
        expect(current_path).to eq root_path
      end
    end

    context 'without a email' do
      it 'fails to login as a user' do
        within('form#login') do
          fill_in 'email', with: user.email
          fill_in 'password', with: ''
          click_button 'ログイン'
        end
        expect(page).to have_content 'ログインに失敗しました'
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'after login' do
    before { login_as(user) }

    it 'logouts' do
      find('#dropdown-menu').click
      click_link('ログアウト')
      expect(page).to have_content 'ログアウトしました'
      expect(current_path).to eq root_path
    end
  end
end
