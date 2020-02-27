import { firebaseConfig } from './firebase.js';
firebase.initializeApp(firebaseConfig);

const forecastUrl = "http://localhost:3000/tommorow_forecast";
const weatherUrl = "http://localhost:3000/get_observed_weather";

var yesterday = new Date();
yesterday.setDate(yesterday.getDate()-1);
document.getElementById("date").max = yesterday.getFullYear() + '-' + ("0"+(yesterday.getMonth()+1)).slice(-2) + '-' + ("0"+yesterday.getDate()).slice(-2);

var min = new Date();
min.setDate(min.getDate()-30);
document.getElementById("date").min = min.getFullYear() + '-' + ("0"+(min.getMonth()+1)).slice(-2) + '-' + ("0"+min.getDate()).slice(-2);

new Vue({
  el: "#app",
  data: {
    weather: null,
    highestTemperature: null,
    lowestTemperature: null,
    year: null,
    month: null,
    day: null,
    observedDate: null,
    observedWeathers: null,
    observedWeather: null,
    observedHighestTemperature: null,
    observedLowestTemperature: null,
    email: null,
  },

  created: function() {
    axios.get(forecastUrl)
      .then((response) => {
        let date = response.data.forecast.date
        this.year = date.substr(0, 4);
        this.month = date.substr(5, 2);
        this.day = date.substr(8, 2);
        let forecast = response.data.forecast
        this.weather = forecast.weather;
        this.highestTemperature = forecast.highest_temperature;
        this.lowestTemperature = forecast.lowest_temperature;
    })
      .catch((error) => {
        alert(error.message);
    })

    axios.get(weatherUrl)
      .then((response) => {
        this.observedWeathers = response.data.observed_weathers;
      })
      .catch((error) => {
        alert(error.message);
      })

    firebase.auth().onAuthStateChanged((user) => {
      if (user) {
        this.email = user.email;
      } else {
        window.location.href = 'sign_in.html';
      }
    });
  },

  methods: {
    logout: function () {
      firebase.auth().signOut();
    },
    display: function () {
      this.observedWeather = this.observedWeathers[this.observedDate]["weather"];
      this.observedHighestTemperature = this.observedWeathers[this.observedDate]["highest_temperature"];
      this.observedLowestTemperature = this.observedWeathers[this.observedDate]["lowest_temperature"];
    }
  }
});