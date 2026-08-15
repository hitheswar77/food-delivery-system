const admin = require("firebase-admin");

let serviceAccount;
try {
  if (process.env.FIREBASE_SERVICE_ACCOUNT) {
    serviceAccount = JSON.parse(process.env.FIREBASE_SERVICE_ACCOUNT);
  } else {
    serviceAccount = require("./serviceAccountKey.json");
  }
} catch (err) {
  console.warn("⚠️ Firebase credentials not found. Realtime DB features will fail.");
}

if (serviceAccount) {
  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
  });
  console.log("Firestore Connected!");
}

const firestore = admin.firestore();
module.exports = firestore;
