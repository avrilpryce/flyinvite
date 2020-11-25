// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

fetch(`https://tequila-api.kiwi.com/locations/query?term=Berlin&locale=en-US&location_types=airport&limit=10&active_only=true&apikey=${process.env.FLIGHT_SEARCH_API}`)
.then(response => response.json())
.then(data => console.log(data))
