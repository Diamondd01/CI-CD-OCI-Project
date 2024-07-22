document.addEventListener('DOMContentLoaded',function(){
    const apiKey='085a2baf803d961034e4af8cf025ff07'
    const baseUrl = 'http://api.openweathermap.org/data/2.5/forecast';

    const weatherForm = document.getElementById("weatherForm");
    const weatherInfo = document.getElementById("weatherInfo");

    weatherForm.addEventListener('submit', function(event){
        event.preventDefault();
        const city =  document.getElementById('cityInput').value;

        fetchWeatherByCity(city);
    });

    function fetchWeatherByCity(city){
        const apiUrl = `${baseUrl}?q=${cityID}&appid=${apiKey}`;

        fetch(apiUrl)
            .then(response => {
                if(response.ok){
                    throw new Error("Network response was not ok")
                }
                return response.json();
            })
            .then(data => {
                const temperature = data.main.temp;
                const description = data.weather[0].description;
                const cityName = data.name;

                weatherInfo.innerHTML= `<h2>Weather in ${cityName}</h2>
                                        <p>Temperature: ${temperature}</p>
                                        <p>Description: ${description}</p>`
            })
            .catch(error => {
                console.error("There was a problem with the fetch operation",error)
                weatherInfo.innerHTML= `<p>Failed to fetch weather data for ${city}. Please Try Again. </p>`
            });
    }
})