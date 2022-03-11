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

map.addControl(new mapboxgl.NavigationControl())

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
      `
        <p class="m-auto">
          <span class="badge bg-dark me-1">${feature.properties.region}</span>
          <span class="badge bg-success me-1">${feature.properties.placeName}</span>
          <span class="badge bg-primary me-1">${feature.properties.river}</span>
        </p>
        <h5 class="m-2">${feature.properties.route}</h5>
        <a class="btn btn-primary w-100 p-0" href="routes/:id?name=${feature.properties.route}" style="font-size:12px;">詳細</a>
      `
    )
    .addTo(map)
})
