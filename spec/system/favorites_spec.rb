require 'rails_helper'

RSpec.describe 'Favorites', type: :system do
  let(:user) { create(:user) }
  let(:route) { create(:route) }
  let!(:map) { create(:map, route: route) }
  let(:favorite) { create(:favorite, route: route, user: user) }

  describe 'before login' do
    it 'does not display a favorite button' do
      visit route_path(route)
      expect(page).to_not have_selector "#js-favorite-for-route-#{route.id}"
      expect(page).to_not have_selector "#js-unfavorite-for-route-#{route.id}"
      expect(current_path).to eq route_path(route)
    end
  end

  describe 'after login' do
    before { login_as(user) }

    it "adds a route to user's favorites on the routes page" do
      visit routes_path
      within "#route-list-#{route.id}" do
        find("#js-favorite-for-route-#{route.id}").click
        expect(page).to have_selector "#js-unfavorite-for-route-#{route.id}"
      end
    end

    it "removes a route from user's favorites on the routes page" do
      favorite
      visit routes_path
      within "#route-list-#{route.id}" do
        find("#js-unfavorite-for-route-#{route.id}").click
        expect(page).to have_selector "#js-favorite-for-route-#{route.id}"
      end
    end

    it "adds a route to user's favorites on the route page" do
      visit route_path(route)
      find("#js-favorite-for-route-#{route.id}").click
      expect(page).to have_selector "#js-unfavorite-for-route-#{route.id}"
    end

    it "removes a route from user's favorites on the route page" do
      favorite
      visit route_path(route)
      find("#js-unfavorite-for-route-#{route.id}").click
      expect(page).to have_selector "#js-favorite-for-route-#{route.id}"
    end
  end
end
