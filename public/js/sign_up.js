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
      firebase.auth().createUserWithEmailAndPassword(this.email, this.password)
      .then(() => {
        window.location.href = 'index.html';
      })
      .catch((error) => {
        alert(error.message);
        this.password = "";
    });
    },
    signInPage: function () {
      window.location.href = 'sign_in.html';
    }
  }
});