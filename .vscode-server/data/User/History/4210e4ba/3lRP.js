document.addEventListener('DOMContentLoaded',function(){
    const apiKey='085a2baf803d961034e4af8cf025ff07'
    const baseUrl = 'http://api.openweathermap.org/data/2.5/forecast';

    const weatherForm = document.getElementById("weatherForm");
    const weatherInfo = document.getElementById("weatherInfo");

    weatherForm.addEventListener('submit', function(event){
        event.preventDefault();
        const cityId =  document.getElementById('cityIdInput').value;

        fetchWeatherByCity(cityId);
    });

    function fetchWeatherByCity(cityId){
        const apiUrl = `${baseUrl}?q=${cityName}&appid=${apiKey}`;

        fetch(apiUrl)
            .then(response => {
                if(!response.ok){
                    throw new Error("Network response was not ok")
                }
                return response.json();
            })
            .then(data => {
                const forecasts = data.list.slice(0,5);
                const forecastHtml = forecasts.map(forecast =>{
                    return `<p>${forecast.dt_txt}: ${forecast.main.temp} °C - ${forecast.weather[0].description}</p>`
                }).join('');

                weatherInfo.innerHTML= `<h2>Weather Forecast for City ${cityId}</h2>${forecastHtml}`;
            })
            .catch(error => {
                console.error("Fetch Error",error)
                weatherInfo.innerHTML= `<p>Failed to fetch weather data for ${city}. Please Try Again. </p>`
            });
    }
})