const fetchLocationApi = (userinput, locationBoxId, inputId ) => {
    fetch(`https://tequila-api.kiwi.com/locations/query?term=${userinput}&locale=en-US&location_types=airport&limit=10&active_only=true&apikey=${process.env.FLIGHT_SEARCH_API}`)
        .then(response => response.json())
        .then(data => {

            const locationBox = document.getElementById(locationBoxId)                 // find location box 

            const locations = data.locations.slice(0,5)                                // select first 5 airport locations from the location api
            locations.forEach(location => {                                           // iterate over the 5 airports

                const airportElementId = `airports-${location.id}` // save element unique id in a variable
                const airportIata = `<li class="airports" id="${airportElementId}">${location.id}</li>`    // create html to insert with uniq id
                locationBox.style.display = 'block';
                locationBox.insertAdjacentHTML("beforeend", airportIata);             // insert beforeend location box

                const airportElement = document.getElementById(airportElementId)
                airportElement.addEventListener('click', (event)=> {                         // add event listener on click
                    const inputField = document.getElementById(inputId)
                    inputField.value = airportElement.innerHTML                           // a. find input  and  b. put inner text of element in input   
                    const airportOption = document.getElementsByClassName("airports");     
                    console.log(airportOption)
                    airportOption.style.display = 'none';                                               // a. find input options
                })
                
                document.addEventListener('mouseup', function(e) {
                    if (!locationBox.contains(e.target)) {
                        locationBox.style.display = 'none';
                    }
                    });
    
                elementIdNumber +=1

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