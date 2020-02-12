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
let forecast_url = "http://localhost:3000/tommorow_forecast";
  
function initApp() {
  firebase.auth().onAuthStateChanged((user) => {
    if (user) {
      var email = user.email;
      document.getElementById("email").innerText = email;
    } else {
      window.location.href = 'sign_in.html';
    }
  });
}

window.onload = () => {
  initApp();
};

window.logout = () => {
  firebase.auth().signOut();
}

new Vue({
  el: "#app",
  data: {
    weather: "",
    highestTemperature: "",
    lowestTemperature: "",
    year: "",
    month: "",
    day: ""
  },
  methods: {
    getForecast: () => {
      axios.get(forecast_url)
        .then((response) => {
          document.getElementById("weather").innerText = response.data.data.weather;
          document.getElementById("highest_temperature").innerText = response.data.data.highest_temperature;
          document.getElementById("lowest_temperature").innerText = response.data.data.lowest_temperature;
          document.getElementById("date").innerText = response.data.data.date;
          this.year = response.data.data.date.substr(0, 4);
          this.month = response.data.data.date.substr(5, 2);
          this.day = response.data.data.date.substr(8, 2);
        })
        .catch((error) => {
          console.log(error);
      })
    }
  }
});