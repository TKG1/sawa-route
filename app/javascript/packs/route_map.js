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

const bounds = [
  [gon.lng - 0.2, gon.lat - 0.1], // west,south
  [gon.lng + 0.2, gon.lat + 0.1], // east,north
]

const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/koheikun/cl03dh6ab002i14p5ns80x3fn',
  center: [gon.lng, gon.lat],
  zoom: 13,
  maxBounds: bounds,
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
      `<a href="https://www.google.com/maps/search/?api=1&query=${feature.geometry.coordinates[1]},${feature.geometry.coordinates[0]}">GoogleMapで開く</a>`
    )
    .addTo(map)
})
