import { firebaseConfig } from './firebase.js';
firebase.initializeApp(firebaseConfig);

new Vue({
  el: "#app",
  data: {
    email: null,
    password: null
  },
  methods: {
    login: function () {
      firebase.auth().signInWithEmailAndPassword(this.email, this.password)
        .then((a) => {
          console.log(a);
        window.location.href = 'index.html';
      })
      .catch((error) => {
        alert(error.message);
        this.password = "";
      });
    },
    signUpPage: function () {
      window.location.href = 'sign_up.html';
    }
  }
});