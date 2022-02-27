/* eslint-disable */
import mapboxgl from '!mapbox-gl'

getScreenSize()

window.addEventListener('resize', getScreenSize)

function getScreenSize() {
  const mapSize = document.getElementById('map')
  mapSize.style.height = document.documentElement.clientHeight + 'px'
  mapSize.style.width = document.documentElement.clientWidth + 'px'
}

mapboxgl.accessToken =
  'pk.eyJ1Ijoia29oZWlrdW4iLCJhIjoiY2t6cDdjMTkzNjZpcTJwdHYxbXAxZnl6ayJ9.RaX5Zwhx-cWf_73LpdeliA'

const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/koheikun/cl00k5dur000m14ny98k0la2z',
  center: [139.769, 35.6804],
  zoom: 5,
})

map.on('click', (event) => {
  const features = map.queryRenderedFeatures(event.point, {
    layers: ['symbols'],
  })
  if (!features.length) {
    return
  }
  const feature = features[0]

  const popup = new mapboxgl.Popup({ offset: [0, -15] })
    .setLngLat(feature.geometry.coordinates)
    .setHTML(
      `<p class="m-0"><span class="badge bg-dark me-1"> ${feature.properties.region}</span>${feature.properties.placeName}</p>
      <p class="m-1">${feature.properties.river}</p>
      <p class="m-1">${feature.properties.route}</p>
      <a href="routes/:id?name=${feature.properties.route}">詳細</a>
      `
    )
    .addTo(map)
})
