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

firebase.auth().onAuthStateChanged((user) => {
  if (user) {
    // User is signed in.
    var displayName = user.displayName;
    var email = user.email;
    var emailVerified = user.emailVerified;
    var photoURL = user.photoURL;
    var isAnonymous = user.isAnonymous;
    var uid = user.uid;
    var providerData = user.providerData;

    console.log(displayName);
  } else {
    console.log("ログインできていません");
  }
});
