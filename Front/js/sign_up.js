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
 
document.getElementById('submit').addEventListener('click', () => {
  email = document.getElementById("email").value;
  password = document.getElementById("password").value;

  firebase.auth().createUserWithEmailAndPassword(email, password)
    .then(() => {
      window.location.href = 'index.html';
    })
    .catch((error) => {
      alert(error.message);
      document.getElementById("password").value = "";
  });
})

window.sign_in = () => {
  window.location.href = 'sign_in.html';
}