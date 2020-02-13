var firebaseConfig = {
  apiKey: "AIzaSyCAj95KnxW_RhAhmHJEQP_JuG0TEviNsG8",
  authDomain: "chatapp-4f52c.firebaseapp.com",
  databaseURL: "https://chatapp-4f52c.firebaseio.com",
  projectId: "chatapp-4f52c",
  storageBucket: "chatapp-4f52c.appspot.com",
  messagingSenderId: "605379077010",
  appId: "1:605379077010:web:9f67306fd37f96d4bdd74b"
};

firebase.initializeApp(firebaseConfig);

new Vue({
  el: "#app",
  data: {
    weather: null,
    highestTemperature: null,
    lowestTemperature: null,
    year: null,
    month: null,
    day: null,
    email: null,
    forecast_url: "http://localhost:3000/tommorow_forecast",
    weather_url: "http://localhost:3000/get_observed_weather"
  },
  created: function() {
    axios.get(this.forecast_url)
    .then((response) => {
      this.year = response.data.data.date.substr(0, 4);
      this.month = response.data.data.date.substr(5, 2);
      this.day = response.data.data.date.substr(8, 2);
      this.weather = response.data.data.weather;
      this.highestTemperature = response.data.data.highest_temperature;
      this.lowestTemperature = response.data.data.lowest_temperature;
    })
    .catch((error) => {
      console.log(error);
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
    getWeather: function () {
      axios.get(this.weather_url)
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
      })
    },
    logout: function () {
      firebase.auth().signOut();
    }
  }
});