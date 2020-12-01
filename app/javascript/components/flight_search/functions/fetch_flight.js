import Rails from '@rails/ujs' 

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
            return airlineName
        })
}


const localDate = (standardDate) => {
    let timeOb = new Date(standardDate)
    timeOb = timeOb.toDateString().slice(0,10)
    console.log(timeOb)
}

const localTime = (standardTime) => {
    let timeOb = new Date(standardTime)
    timeOb = timeOb.toTimeString().slice(0, 5)
    console.log(timeOb)
}


const fetchFlightApi = ({ obDepartureAp, obArrivalAp, ob_date, fare_class, ib_date}) => {
  
    const flightList = document.getElementById('flight-list')
    flightList.innerHTML = " "

    const url = `https://tequila-api.kiwi.com/v2/search?fly_from=${obDepartureAp}&fly_to=${obArrivalAp}&date_from=${ob_date}&date_to=${ob_date}&return_from=${ib_date}&return_to=${ib_date}&max_stopovers=0&selected_cabins=${fare_class}&apikey=${process.env.FLIGHT_SEARCH_API}`
    fetch(url)
      .then(response => response.json())
      .then(data => {
        const flights = data.data

        console.log(flights)

        flights.forEach(flight => {

          let airlineIataDeparture = flight.route[0].airline
          let airlineIataReturn = flight.route[1].airline

          let localDateDepartureOb = localDate(flight["route"][0]["local_departure"])
          let localTimeDepartureOb = localTime(flight["route"][0]["local_departure"])
          // let localTimeArrivalOb =  localTime(flight["route"][0]["local_arrival"])           

          // let localDateDepartureIb = localDate(flight["route"][1]["local_departure"])
          // let localTimeDepartureIb = localTime(flight["route"][1]["local_departure"])
          // let localTimeArrivalIb =   localTime(flight["route"][1]["local_arrival"]) 

          const flightNumberOb = `${airlineIataDeparture}${flight["route"][0]["flight_no"]}`
          const flightNumberIb = `${airlineIataReturn}${flight["route"][1]["flight_no"]}`
          const bookingPrice = flight.price
    
    
         const html =
              `<div class="card">
                  <div class="row card-body align-items-center">
                    <div class="input-group-text pick-flight col-1 mr-n4 mt-n25 ml-4">
                      <input type="checkbox" class="checkbox" id="${flight.id}" aria-label="Select flight option.">
                    </div>
                    <div class="col-3 my-n4 ml-2 mb-n2 card-image">
                      <img class="airline-logo my-n2"src="http://pics.avs.io/150/150/${airlineIataDeparture}.png" alt="">
                    </div>
                    <div class="col-3">
                      <h5>${localDateDepartureOb}</h5>
                      <h5><strong>${localTimeDepartureOb} - ${localTime(flight["route"][0]["local_arrival"])}</strong></h5>
                      <h5>${flightNumberOb}</h5>
                    </div>
                    <div class="col ml-4">
                      <h5><strong>${Math.round((Number(flight["duration"]["departure"])/60)/60)}hrs</strong></p>
                      <h5>${flight["route"][0]["flyFrom"]} - ${flight["route"][0]["flyTo"]}</h5>
                    </div>
                    <div class="col">
                      <h5><strong>${bookingPrice}€</strong></h5>
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
                      <h5>${flightNumberIb}</h5>
                    </div>
                    <div class="col ml-4">
                      <h5><strong>${Math.round((Number(flight["duration"]["return"])/60)/60)}hrs</strong></p>
                      <h5>${flight["route"][1]["flyFrom"]} - ${flight["route"][1]["flyTo"]}</h5>
                    </div>
                    <div class="col">
                    </div>
                  </div>
              </div>`

            flightList.insertAdjacentHTML("beforeend", html)
            const flightCheckbox = document.getElementById(flight.id)
            // console.log(flightCheckbox)
            flightCheckbox.addEventListener('change', (event) => {

              const routePrice = bookingPrice / 2

              if (flightCheckbox.checked == true) {
                  console.log("Book")
                  const chosenFlight = {

                    outbound: {
                      departure_airport_code: obDepartureAp,
                      arrival_airport_code: obArrivalAp,
                      airline: fetchAirlineName(airlineIataDeparture),
                      flight_number: flightNumberOb,
                      price: routePrice, 
                      flight_class: fare_class,
                      departure_date_local: flight["route"][0]["local_departure"],
                      arrival_date_local: flight["route"][0]["local_arrival"],
                      departure_date_utc: flight["route"][0]["utc_departure"],
                      arrival_date_utc: flight["route"][0]["utc_arrival"],
                      booking_link: `https://www.kiwi.com/deep?booking_token=${flight.booking_token}`,
                      booked: false
                    },

                    inbound: {
                      departure_airport_code: obArrivalAp,
                      arrival_airport_code: obDepartureAp,
                      airline: fetchAirlineName(airlineIataReturn),
                      flight_number: flightNumberIb,
                      price: routePrice, 
                      flight_class: fare_class,
                      departure_date_local: flight["route"][1]["local_departure"],
                      arrival_date_local: flight["route"][1]["local_arrival"],
                      departure_date_utc: flight["route"][1]["utc_departure"],
                      arrival_date_utc: flight["route"][1]["utc_arrival"],
                      booking_link: `https://www.kiwi.com/deep?booking_token=${flight.booking_token}`,
                      booked: false
                    },

                    booking_price: bookingPrice
          
                  }
                  
                  const tripId = document.querySelector("#trip").dataset.id

                  const formData = new FormData();
                  formData.append("flight_booking", JSON.stringify(chosenFlight));


                  Rails.ajax({
                    url: `/trips/${tripId}/flight_bookings`,
                    type: "post",
                    data: formData,
                    success: function(data) { 
                      console.log("Created")
                    },
                    error: function(data) {alert('something went wrong!')}
                  })
              
                  console.log(chosenFlight)

              } else if (flightCheckbox.checked == false) {
                  console.log("Delete")

              }
            })
        })
      })


}

export {
    fetchFlightApi
}