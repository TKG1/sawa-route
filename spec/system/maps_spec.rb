require 'rails_helper'

RSpec.describe 'Maps', type: :system do
  describe 'before login' do
    it 'desplays a map' do
      visit root_path
      click_link 'マップ'
      expect(current_path).to eq maps_path
    end

    # mapのポップアップからルート詳細ページへ遷移する
  end

  describe 'after login' do
    let(:user) { create(:user) }

    before { login_as(user) }

    it 'desplays a map' do
      visit root_path
      click_link 'マップ'
      expect(current_path).to eq maps_path
    end
  end
end
