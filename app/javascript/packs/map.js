import mapboxgl from '!mapbox-gl' // or "const mapboxgl = require('mapbox-gl');"

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
  container: 'map', // container ID
  style: 'mapbox://styles/koheikun/cl00k5dur000m14ny98k0la2z', // style URL
  center: [139.769, 35.6804], // starting position [lng, lat] Tokyo
  zoom: 5, // starting zoom
})

map.on('click', (event) => {
  const features = map.queryRenderedFeatures(event.point, {
    layers: ['symbols'], // replace with your layer name
  })
  if (!features.length) {
    return
  }
  const feature = features[0]

  // Code from the next step will go here.
  const popup = new mapboxgl.Popup({ offset: [0, -15] })
    .setLngLat(feature.geometry.coordinates)
    .setHTML(
      `<p class="m-0"><span class="badge bg-dark me-1"> ${feature.properties.region}</span>${feature.properties.placeName}</p>
      <p class="m-1">${feature.properties.river}</p>
      <p class="m-1">${feature.properties.route}</p>`
    )

  popup.addTo(map)
})
