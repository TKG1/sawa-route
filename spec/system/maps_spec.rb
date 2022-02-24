require 'rails_helper'

RSpec.describe 'Maps', type: :system do
  # ログイン前、ログイン後でもindexページでマップが表示される
  describe 'before login' do
    it 'desplays a map' do
      visit root_path
      ckick_link 'マップ'
      expext(current_path).to eq maps_path
    end
  end

  describe 'after login' do
    it 'desplays a map' do
      visit root_path
      ckick_link 'マップ'
      expext(current_path).to eq maps_path
    end
  end
end
