// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

const input = document.getElementById('auto-complete')
const locationBox = document.getElementById('locations')


const fetchApi = (userinput) => {
    fetch(`https://tequila-api.kiwi.com/locations/query?term=${userinput}&locale=en-US&location_types=airport&limit=10&active_only=true&apikey=${process.env.FLIGHT_SEARCH_API}`)
    .then(response => response.json())
    .then(data => {
        const locations = data.locations

        let html = ""

        locations.forEach (location => {
        html += `<li>${location.id}</li>`
        } )
        locationBox.innerHTML = html
        // $.ajax({
        //     url: 'http://localhost:3000/search_flights',
        //     type: "POST",
        //     data,
        //     success: function(data, textStatus, jqXHR) {
        //         alert('Success!');
        //     },
        //     error: function(jqXHR, textStatus, errorThrown) {
        //         alert('Error occurred!');
        //     }
        // })
    })
}


input.addEventListener('keydown',(event)=> { 
    const userInput = event.target.value
    fetchApi(userInput)
})