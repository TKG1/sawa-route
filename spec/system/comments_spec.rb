require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  let(:user) { create(:user, :avatar) }
  let(:other_user) { create(:user) }
  let(:route) { create(:route) }
  let!(:map) { create(:map, route_id: route.id) }
  let(:comment) { create(:comment, user_id: user.id, route_id: route.id) }
  let!(:other_comment) { create(:comment, user_id: other_user.id, route_id: route.id) }

  describe 'before login' do
    before { visit route_path(comment.route) }

    context 'when create a comment' do
      it 'redirect to login page' do
        find_link('コメントをする').click
        fill_in 'コメントを投稿する', with: 'test_test'
        click_button '投稿'

        expect(page).to have_content 'ログインをしてください'
        expect(current_path).to eq login_path
      end
    end

    it 'does not display to a update & destroy button' do
      within "#comment-#{comment.id}" do
        expect(page).to_not have_content '編集'
        expect(page).to_not have_content '削除'
      end
    end
  end

  describe 'after login' do
    before do
      login_as(user)
      visit route_path(comment.route)
    end

    it 'creates a comment' do
      find_link('コメントをする').click
      fill_in 'コメントを投稿する', with: 'test_test'
      click_button '投稿'

      # モーダルの挙動が不安定なのでページをリロードする
      visit current_path
      new_comment = Comment.find_by(text: 'test_test')
      within "#comment-#{new_comment.id}" do
        expect(page).to have_content 'test_test'
        expect(page).to have_content new_comment.user.name
        expect(page).to have_content I18n.l(new_comment.updated_at, format: :default)
        expect(page).to have_selector "img[src$='avatar.png']"
        expect(current_path).to eq route_path(comment.route)
      end
    end

    it 'does not create a comment without text' do
      find_link('コメントをする').click
      fill_in 'コメントを投稿する', with: ''
      click_button '投稿'

      expect(page).to have_content '文字を入力してください'
      expect(current_path).to eq route_path(comment.route)
    end

    it "updates user's own comment" do
      within "#comment-#{comment.id}" do
        click_link '編集'
      end
      fill_in 'コメントを投稿する', with: 'test1234'
      click_button '投稿'

      visit current_path
      within "#comment-#{comment.id}" do
        expect(page).to have_content 'test1234'
        expect(page).to have_content comment.user.name
        expect(page).to have_content I18n.l(comment.updated_at, format: :default)
        expect(page).to have_selector "img[src$='avatar.png']"
        expect(current_path).to eq route_path(comment.route)
      end
    end

    it "destroys user's own comment" do
      within "#comment-#{comment.id}" do
        accept_alert { click_link '削除' }
      end

      expect(page).to_not have_selector "#comment-#{comment.id}"
      expect(current_path).to eq route_path(comment.route)
    end

    it 'does not display to a update & destroy button' do
      within "#comment-#{other_comment.id}" do
        expect(page).to_not have_content '編集'
        expect(page).to_not have_content '削除'
      end
    end
  end
end
