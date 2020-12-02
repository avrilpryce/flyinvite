const fetchLocationApi = (userinput, htmlId ) => {
    fetch(`https://tequila-api.kiwi.com/locations/query?term=${userinput}&locale=en-US&location_types=airport&limit=10&active_only=true&apikey=${process.env.FLIGHT_SEARCH_API}`)
        .then(response => response.json())
        .then(data => {

            let html = ""
            const locations = data.locations.slice(0,5)
            console.log(locations)
            locations.forEach(location => {
                html += `<li><input class="airports" value="${location.id}"></input></li>`
            })
            const locationBox = document.getElementById(htmlId)
            locationBox.innerHTML = html
        })
}

export {
    fetchLocationApi
}