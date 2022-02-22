require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'create a new user' do
    describe 'before login' do
      let(:user) { create(:user) }

      before { visit new_user_path }

      context 'when the input values are nomal' do
        it 'creates a new user' do
          fill_in 'user_name', with: 'test'
          fill_in 'user_email', with: 'example@example.com'
          fill_in 'user_password', with: 'password'
          fill_in 'user_password_confirmation', with: 'password'
          click_button '登録'
          expect(page).to_not have_selector '#error_messages'
          expect(page).to have_content 'ユーザーを登録しました'
          expect(current_path).to eq root_path
        end
      end

      context 'without a email' do
        it 'fails to create a new user' do
          fill_in 'user_name', with: 'test'
          fill_in 'user_email', with: ''
          fill_in 'user_password', with: 'password'
          fill_in 'user_password_confirmation', with: 'password'
          click_button '登録'
          expect(page).to have_selector '#error_messages'
          expect(page).to have_content 'メールアドレスを入力してください'
          expect(current_path).to eq users_path
        end
      end

      context 'when use a duplicate email' do
        it 'fails to create a new user' do
          fill_in 'user_name', with: 'test'
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: 'password'
          fill_in 'user_password_confirmation', with: 'password'
          click_button '登録'
          expect(page).to have_selector '#error_messages'
          expect(page).to have_content 'メールアドレスはすでに存在します'
          expect(current_path).to eq users_path
        end
      end
    end
  end
end
