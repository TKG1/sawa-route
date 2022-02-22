require 'rails_helper'

RSpec.describe 'Profiles', type: :system do
  let(:user) { create(:user) }

  describe 'before login' do
    context 'when access to the profile page' do
      it 'redirects to the login page' do
        visit profiles_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
      end
    end

    context 'when access to the edit profile page' do
      it 'redirects to the login page' do
        visit edit_profiles_path
        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'after login' do
    before { login_as(user) }

    it "displays a user's profile" do
      visit root_path
      find('#dropdown-menu').click
      click_link('プロフィール')

      expect(page).to have_content user.name
      expect(page).to have_content user.email
      expect(current_path).to eq profiles_path
    end

    context 'with a name, email, avatar' do
      it "updates a user's profile" do
        visit edit_profiles_path
        fill_in 'user_name', with: "#{user.name}hoge"
        fill_in 'user_email', with: "hoge#{user.email}"
        file_path = Rails.root.join('spec/fixtures/avatar.png')
        attach_file('user_avatar', file_path)
        click_button '更新'

        expect(page).to have_content 'プロフィールを更新しました'
        expect(page).to have_content user.name
        expect(page).to have_content user.email
        expect(page).to have_selector "img[src$='avatar.png']"
        expect(current_path).to eq profiles_path
      end
    end

    context 'without a name & email' do
      it "fails to update a user's profile" do
        visit edit_profiles_path
        fill_in 'user_name', with: ''
        fill_in 'user_email', with: ''
        click_button '更新'

        expect(page).to have_selector '#error_messages'
        expect(page).to have_content '名前を入力してください'
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(current_path).to eq profiles_path
      end
    end
  end
end
