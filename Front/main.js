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
  
function initApp() {
  firebase.auth().onAuthStateChanged((user) => {
    if (user) {
      var email = user.email;
      var uid = user.uid;

      console.log(email);
      document.getElementById("email").innerText = email;
    } else {
      console.log("ログインできていません");
      window.location.href = 'sign_up.html';
    }
  });
}

window.onload = () => {
  initApp();
};

// ログアウト機能の作成
window.logout = () => {
  firebase.auth().signOut();
  window.location.href = 'sign_in.html';
}

