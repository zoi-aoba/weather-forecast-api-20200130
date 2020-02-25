const firebaseConfig = {
  apiKey: "AIzaSyCAj95KnxW_RhAhmHJEQP_JuG0TEviNsG8",
  authDomain: "chatapp-4f52c.firebaseapp.com",
  databaseURL: "https://chatapp-4f52c.firebaseio.com",
  projectId: "chatapp-4f52c",
  storageBucket: "chatapp-4f52c.appspot.com",
  messagingSenderId: "605379077010",
  appId: "1:605379077010:web:9f67306fd37f96d4bdd74b"
};

firebase.initializeApp(firebaseConfig);

const forecastUrl = "http://localhost:3000/tommorow_forecast";
const weatherUrl = "http://localhost:3000/get_observed_weather";

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
      date = response.data.forecast.date
      this.year = date.substr(0, 4);
      this.month = date.substr(5, 2);
      this.day = date.substr(8, 2);
      forecast = response.data.forecast
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