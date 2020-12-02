
import { fetchFlightApi } from "./functions/fetch_flight.js";
import { fetchLocationApi } from "./functions/fetch_location.js";


const flightSearch = () => {
    
    const search = document.getElementById('search')
    const departureOb = document.getElementById('obDepartureAp')
    const arrivalOb = document.getElementById('obArrivalAp')

    if (departureOb && search && arrivalOb) {

        search.addEventListener('click',(event)=> { 
            const fareClass = document.getElementById('fare-class')
            // const route = document.getElementById('route')
            const obDate = document.getElementById('ob_date')
            const ibDate = document.getElementById('ib_date')
            fetchFlightApi({
                obDepartureAp: departureOb.value,
                obArrivalAp: arrivalOb.value,
                fare_class: fareClass.value,
                ob_date: obDate.value,
                ib_date: ibDate.value
                // route: route.value
            }
            )
        })
        
        departureOb.addEventListener('keyup',(event)=> { 
            const userInput = event.target.value
            fetchLocationApi(userInput, "departure-airports")
        })

        arrivalOb.addEventListener('keyup',(event)=> { 
            const userInput = event.target.value
            fetchLocationApi(userInput, "arrival-airports")
        })

    }   

}


export { flightSearch }