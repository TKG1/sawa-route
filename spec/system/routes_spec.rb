require 'rails_helper'

RSpec.describe 'Routes', type: :system do
  let(:route) { create(:route) }
  let(:map) { create(:map, route_id: route.id) }

  describe 'before login' do
    context 'with a route data' do
      before { map }

      it 'displays the route list' do
        visit root_path
        click_link 'ルート一覧'
        expect(current_path).to eq routes_path
        expect(page).to have_selector "#route-list-#{route.id}"
        within "#route-list-#{route.id}" do
          expect(page).to have_content route.name
          expect(page).to have_content route.level
          expect(page).to have_content route.schedule
          expect(page).to have_content route.time
          expect(page).to have_content route.mountain.name
          expect(page).to have_selector "img[src$='mountain.png']"
          expect(page).to have_content route.mountain.prefecture.name
        end
      end

      it 'displays two route lists with an another route data' do
        another_route = create(:route)
        visit routes_path
        expect(page).to have_selector "#route-list-#{route.id}"
        expect(page).to have_selector "#route-list-#{another_route.id}"
        within "#route-list-#{route.id}" do
          expect(page).to have_content route.name
          expect(page).to have_content route.level
          expect(page).to have_content route.schedule
          expect(page).to have_content route.time
          expect(page).to have_content route.mountain.name
          expect(page).to have_selector "img[src$='mountain.png']"
          expect(page).to have_content route.mountain.prefecture.name
        end
        within "#route-list-#{another_route.id}" do
          expect(page).to have_content another_route.name
          expect(page).to have_content another_route.level
          expect(page).to have_content another_route.schedule
          expect(page).to have_content another_route.time
          expect(page).to have_content another_route.mountain.name
          expect(page).to have_selector "img[src$='mountain.png']"
          expect(page).to have_content another_route.mountain.prefecture.name
        end
        expect(current_path).to eq routes_path
      end

      it 'displays the detailed route' do
        visit routes_path
        find("#route-list-#{route.id}").click
        expect(page).to have_content route.name
        expect(page).to have_content route.description
        expect(page).to have_content route.level
        expect(page).to have_content route.schedule
        expect(page).to have_content route.time
        expect(page).to have_content route.length
        expect(page).to have_content route.mountain.name
        expect(page).to have_selector "img[src$='mountain.png']"
        expect(page).to have_content route.mountain.prefecture.name
        expect(page).to have_selector '#map'
        expect(current_path).to eq route_path(route)
      end

      it 'displays the detailed route on the map' do
        visit route_path(route)
        find('#map').click
        expect(page).to have_selector '#map'
        expect(current_path).to eq map_path(map)
      end
    end
  end

  context 'without route data' do
    it 'does not display route list' do
      visit root_path
      click_link 'ルート一覧'
      expect(page).to have_content 'ルート情報がありません'
      expect(current_path).to eq routes_path
    end
  end

  describe 'after login' do
    let(:user) { create(:user) }

    before { login_as(user) }

    context 'with a route data' do
      before { map }

      it 'displays the route list' do
        visit root_path
        click_link 'ルート一覧'
        expect(current_path).to eq routes_path
        expect(page).to have_selector "#route-list-#{route.id}"
        within "#route-list-#{route.id}" do
          expect(page).to have_content route.name
          expect(page).to have_content route.level
          expect(page).to have_content route.schedule
          expect(page).to have_content route.time
          expect(page).to have_content route.mountain.name
          expect(page).to have_selector "img[src$='mountain.png']"
          expect(page).to have_content route.mountain.prefecture.name
        end
      end

      it 'displays two route lists with an another route data' do
        another_route = create(:route)
        visit routes_path
        expect(page).to have_selector "#route-list-#{route.id}"
        expect(page).to have_selector "#route-list-#{another_route.id}"
        within "#route-list-#{route.id}" do
          expect(page).to have_content route.name
          expect(page).to have_content route.level
          expect(page).to have_content route.schedule
          expect(page).to have_content route.time
          expect(page).to have_content route.mountain.name
          expect(page).to have_selector "img[src$='mountain.png']"
          expect(page).to have_content route.mountain.prefecture.name
        end
        within "#route-list-#{another_route.id}" do
          expect(page).to have_content another_route.name
          expect(page).to have_content another_route.level
          expect(page).to have_content another_route.schedule
          expect(page).to have_content another_route.time
          expect(page).to have_content another_route.mountain.name
          expect(page).to have_selector "img[src$='mountain.png']"
          expect(page).to have_content another_route.mountain.prefecture.name
        end
        expect(current_path).to eq routes_path
      end

      it 'displays the detailed route' do
        visit routes_path
        find("#route-list-#{route.id}").click
        expect(page).to have_content route.name
        expect(page).to have_content route.description
        expect(page).to have_content route.level
        expect(page).to have_content route.schedule
        expect(page).to have_content route.time
        expect(page).to have_content route.length
        expect(page).to have_content route.mountain.name
        expect(page).to have_selector "img[src$='mountain.png']"
        expect(page).to have_content route.mountain.prefecture.name
        expect(page).to have_selector '#map'
        expect(current_path).to eq route_path(route)
      end

      it 'displays the detailed route on the map' do
        visit route_path(route)
        find('#map').click
        expect(page).to have_selector '#map'
        expect(current_path).to eq map_path(map)
      end
    end
  end

  context 'without route data' do
    it 'does not display route list' do
      visit root_path
      click_link 'ルート一覧'
      expect(page).to have_content 'ルート情報がありません'
      expect(current_path).to eq routes_path
    end
  end
end
