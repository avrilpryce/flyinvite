const fetchLocationApi = (userinput, locationBoxId, inputId ) => {
    fetch(`https://tequila-api.kiwi.com/locations/query?term=${userinput}&locale=en-US&location_types=airport&limit=10&active_only=true&apikey=${process.env.FLIGHT_SEARCH_API}`)
        .then(response => response.json())
        .then(data => {

            const locationBox = document.getElementById(locationBoxId)                 // find location box 
           
            const locations = data.locations.slice(0,5)                               // select first 5 airport locations from the location api
            locationBox.innerHTML = " "
            locations.forEach(location => {                                           // iterate over the 5 airports

                const airportElementId = `airports-${location.id}` // save element unique id in a variable
                const airportIataHTML = `<li class="airports" id="${airportElementId}">${location.id}</li>`    // create html to insert with uniq id
                locationBox.insertAdjacentHTML("beforeend", airportIataHTML);             // insert beforeend location box

                const airportElement = document.getElementById(airportElementId)
                airportElement.addEventListener('click', (event)=> {                         // add event listener on click
                    const inputField = document.getElementById(inputId)
                    inputField.value = airportElement.innerHTML                           // a. find input  and  b. put inner text of element in input   
                    const airportOptions = document.getElementsByClassName("airports");     
                    console.log(airportOptions)
                    locationBox.innerHTML = " ";                                               // a. find input options
                })
                
                document.addEventListener('mouseup', function(e) {
                    if (!locationBox.contains(e.target)) {
                        locationBox.innerHTML = " ";
                    }
                });
    
            })
        })
}

export {
    fetchLocationApi
}





// find location box
// find the locations and iterate 
    // create html to insert with uniq id
    // ins beforeend loc box
    // find the element by id
    // add event list click
        // 1. populate input
            // a. find input 
            // b. put inner text of element in input "clicked-box"
        // 2. hide input
            // a. find input 
            // b. remove from DOM
        // NOTE: Make this a function
      
 let html = ""