// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
const input = document.getElementById('obDepartureAp')
const arrivalOb = document.getElementById('ob_arrival_ap')
const locationBox = document.getElementById('locations')
const search = document.getElementById('search')
const flightList = document.getElementById('flight-list')


// function selectAirport () {
//   console.log("Test")

// }


search.addEventListener('click',(event)=> { 
    const fareClass = document.getElementById('fare-class')
    const route = document.getElementById('route')
    const obDate = document.getElementById('ob_date')
    const ibDate = document.getElementById('ib_date')
    fetchFlightApi({
        ob_arrival_ap: arrivalOb.value,
        obDepartureAp: input.value,
        fare_class: fareClass.value,
        ob_date: obDate.value,
        ib_date: ibDate.value,
        route: route.value
    }
    )
})



input.addEventListener('keydown',(event)=> { 
    const userInput = event.target.value
    fetchApi(userInput)
})

let airports = ""

const fetchApi = (userinput) => {
    fetch(`https://tequila-api.kiwi.com/locations/query?term=${userinput}&locale=en-US&location_types=airport&limit=10&active_only=true&apikey=${process.env.FLIGHT_SEARCH_API}`)
    .then(response => response.json())
    .then(data => {
        const locations = data.locations

        let html = ""

        locations.forEach (location => {
        html += `<li><input  class="airports" value="${location.id}"></input></li>`
        } )
        locationBox.innerHTML = html
    })
}

// $(document).ready(function() {
//     $(document).on('click', 'airports', function(e) {
//         e.preventDefault();
//         console.log("test")
//     });
// });

const fetchFlightApi = ({ obDepartureAp, ob_arrival_ap,ob_date,fare_class, route, ib_date }) => {
    const url = `https://tequila-api.kiwi.com/v2/search?fly_from=${obDepartureAp}&fly_to=${ob_arrival_ap}&date_from=${ob_date}&date_to=${ob_date}&return_from=${ib_date}&return_to=${ib_date}&max_stopovers=${route}&selected_cabins=${fare_class}&apikey=${process.env.FLIGHT_SEARCH_API}`
    console.log(url)
    fetch(url)
    .then(response => response.json())
    .then(data => {
        console.log(data)
        const flights = data.data

        let html = ""

        flights.forEach (flight => {
        html += `<div class="card"><div class="card-body">${flight.price}<p>${flight.route[0].airline}</p></div></div>`
        } )
        console.log({flightList})
        flightList.innerHTML = html
    })
}








// `<div class="card"><div class="card-body">${flight.price}</div></div>`


// obDepartureAp
// ob_arrival_ap
// ob_date

// fare_class
// route

// ib_departure_ap
// ib_arrival_ap
// ib_date