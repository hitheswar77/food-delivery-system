const admin = require("firebase-admin");
const serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const firestore = admin.firestore();
console.log("Firestore Connected!");

module.exports = firestore;
