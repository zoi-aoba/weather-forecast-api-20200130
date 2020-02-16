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

new Vue({
  el: "#forecast",
  data: {
    weather: null,
    highestTemperature: null,
    lowestTemperature: null,
    year: null,
    month: null,
    day: null,
    date: null,
    observedWeathers: null,
    observedWeather: null,
    observedHighestTemperature: null,
    observedLowestTemperature: null,
    forecastUrl: "http://localhost:3000/tommorow_forecast",
    weatherUrl: "http://localhost:3000/get_observed_weather",
    email: null,
    date: null
  },

  created: function() {
    axios.get(this.forecastUrl)
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
      alert(error);
    })

    axios.get(this.weatherUrl)
      .then((response) => {
        this.observedWeathers = response.data.data;
      })
      .catch((error) => {
        console.log(error);
        alert(error);
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
      axios.get(this.weatherUrl)
        .then((response) => {
          console.log(response);
        })
        .catch((error) => {
          console.log(error);
          alert(error);
      })
    },
    logout: function () {
      firebase.auth().signOut();
    },
    display: function () {
      this.observedWeather = this.observedWeathers[this.date]["weather"];
      this.observedHighestTemperature = this.observedWeathers[this.date]["highest_temperature"];
      this.observedLowestTemperature = this.observedWeathers[this.date]["lowest_temperature"];
    }
  },
});

var min_objDate = new Date();
min_objDate.setDate(min_objDate.getDate() - 30);
document.getElementById("past_date").min = min_objDate.getFullYear() + "-" + String(min_objDate.getMonth() + 1) + "-" + min_objDate.getDate();

var max_objDate = new Date();
max_objDate.setDate(max_objDate.getDate() - 30);
document.getElementById("past_date").max = max_objDate.getFullYear() + "-" + String(max_objDate.getMonth() + 1) + "-" + max_objDate.getDate();
