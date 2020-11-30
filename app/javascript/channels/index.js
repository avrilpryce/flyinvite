// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)
const input = document.getElementById('obDepartureAp')
const arrivalOb = document.getElementById('ob_arrival_ap')
const locationBox = document.getElementById('locations')
const search = document.getElementById('search')
const flightList = document.getElementById('flight-list')
const flightSelect = document.getElementsByClassName('checkbox')


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




// Attempt to convert airline IATA codes to airline names
// const iataCode = "DL"



const fetchAirlineName = (iataCode) => {
    fetch(`https://iata-and-icao-codes.p.rapidapi.com/airline?iata_code=${iataCode}`, {
        "method": "GET",
        "headers": {
            "x-rapidapi-key": "362fb13d72mshf0c9075af340a2ap1ad897jsn80428ab5b0ff",
            "x-rapidapi-host": "iata-and-icao-codes.p.rapidapi.com"
        }
    })
        .then(response => response.json())
        .then(data => {
                let airlineName = data[0].name
                console.log(airlineName)
            })
}


const localTime = (standardTime) => {
    let timeOb = new Date(standardTime)
    timeOb = timeOb.toTimeString().slice(0,5)
}

const localDate = (standardDate) => {
    let timeOb = new Date(standardDate)
    timeOb = timeOb.toDateString().slice(0,10)
}


const fetchFlightApi = ({ obDepartureAp, ob_arrival_ap,ob_date,fare_class, route, ib_date }) => {

    flightList.innerHTML = " "

    // if (route === "round") {

        const url = `https://tequila-api.kiwi.com/v2/search?fly_from=${obDepartureAp}&fly_to=${ob_arrival_ap}&date_from=${ob_date}&date_to=${ob_date}&return_from=${ib_date}&return_to=${ib_date}&max_stopovers=0&selected_cabins=${fare_class}&flight_type=${route}&apikey=${process.env.FLIGHT_SEARCH_API}`
        fetch(url)
        .then(response => response.json())
        .then(data => {
            console.log(data)
            const flights = data.data
            
            let html = ""
            let airlineShortName = ""
    
            flights.forEach (flight => {
            
                let airlineIataDeparture = flight.route[0].airline
                let airlineIataReturn = flight.route[1].airline
                airlineShortName = fetchAirlineName(airlineIataDeparture)
                console.log(airlineShortName)
    
                    html += 
                    `<div class="card">
                        <div class="row card-body align-items-center">
                          <div class="input-group-text pick-flight col-1 mr-n4 mt-n25 ml-4">
                            <input type="checkbox" class="checkbox" aria-label="Select flight option.">
                          </div>
                          <div class="col-3 my-n4 ml-2 mb-n2 card-image">
                            <img class="airline-logo my-n2"src="http://pics.avs.io/150/150/${airlineIataDeparture}.png" alt="">
                          </div>
                          <div class="col-3">
                            <h5>${localDate(flight["route"][0]["local_departure"])}</h5>
                            <h5><strong>${localTime(flight["route"][0]["local_departure"])} - ${localTime(flight["route"][0]["local_arrival"])}</strong></h5>
                            <h5>${airlineIataDeparture}${flight["route"][0]["flight_no"]}</h5>
                          </div>
                          <div class="col ml-4">
                            <h5><strong>${Math.round((Number(flight["duration"]["departure"])/60)/60)}hrs</strong></p>
                            <h5>${flight["route"][0]["flyFrom"]} - ${flight["route"][0]["flyTo"]}</h5>
                          </div>
                          <div class="col">
                            <h5><strong>${flight.price}€</strong></h5>
                          </div>
                        </div>
                        <div class="row card-body align-items-center border-top">
                          <div class="input-group-text pick-flight col-1 mr-n4 mt-n25 ml-4">
                          </div>
                          <div class="col-3 my-n4 ml-2 mb-n2 card-image">
                            <img class="airline-logo my-n2"src="http://pics.avs.io/150/150/${airlineIataReturn}.png" alt="">
                          </div>
                          <div class="col-3">
                            <h5>${localDate(flight["route"][1]["local_departure"])}</h5>
                            <h5><strong>${localTime(flight["route"][1]["local_departure"])} - ${localTime(flight["route"][1]["local_arrival"])}</strong></h5>
                            <h5>${airlineIataReturn}${flight["route"][1]["flight_no"]}</h5>
                          </div>
                          <div class="col ml-4">
                            <h5><strong>${Math.round((Number(flight["duration"]["return"])/60)/60)}hrs</strong></p>
                            <h5>${flight["route"][1]["flyFrom"]} - ${flight["route"][1]["flyTo"]}</h5>
                          </div>
                          <div class="col">
                            <h5><strong>${flight.price}€</strong></h5>
                          </div>
                        </div>
                    </div>`
        
    // } else {
    //     const url = `https://tequila-api.kiwi.com/v2/search?fly_from=${obDepartureAp}&fly_to=${ob_arrival_ap}&date_from=${ob_date}&date_to=${ob_date}&max_stopovers=0&selected_cabins=${fare_class}&flight_type=${route}&apikey=${process.env.FLIGHT_SEARCH_API}`
    //     fetch(url)
    //     .then(response => response.json())
    //     .then(data => {
    //         console.log(data)
    //         const flights = data.data
            
    //         let html = ""
    //         let airlineShortName = ""
    
    //         flights.forEach (flight => {
            
    //             let airlineIataDeparture = flight.route[0].airline
    //             let airlineIataReturn = flight.route[1].airline
    //             airlineShortName = fetchAirlineName(airlineIataDeparture)
    //             console.log(airlineShortName)
    
    //                 html += 
    //                 `<div class="card">
    //                     <div class="row card-body align-items-center">
    //                       <div class="input-group-text pick-flight col-1 mr-n4 mt-n25 ml-4">
    //                         <input type="checkbox" aria-label="Select flight option.">
    //                       </div>
    //                       <div class="col-3 my-n4 ml-2 mb-n2 card-image">
    //                         <img class="airline-logo my-n2"src="http://pics.avs.io/150/150/${airlineIataDeparture}.png" alt="">
    //                       </div>
    //                       <div class="col-3">
    //                         <h5>${localDate(flight["route"][0]["local_departure"])}</h5>
    //                         <h5><strong>${localTime(flight["route"][0]["local_departure"])} - ${localTime(flight["route"][0]["local_arrival"])}</strong></h5>
    //                         <h5>${airlineIataDeparture}${flight["route"][0]["flight_no"]}</h5>
    //                       </div>
    //                       <div class="col ml-4">
    //                         <h5><strong>${Math.round((Number(flight["duration"]["departure"])/60)/60)}hrs</strong></p>
    //                         <h5>${flight["route"][0]["flyFrom"]} - ${flight["route"][0]["flyTo"]}</h5>
    //                       </div>
    //                       <div class="col">
    //                         <h5><strong>${flight.price}€</strong></h5>
    //                       </div>
    //                     </div>
    //                   </div>`
    // }

} )
        flightList.innerHTML = html
    })
}


flightSelect.addEventListener('click',(event)=> { 
    const userInput = event.target.value
    fetchApi(userInput)
})
