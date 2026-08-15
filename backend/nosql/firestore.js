const admin = require("firebase-admin");
const fs = require("fs");
const path = require("path");

let serviceAccount;
try {
  if (process.env.FIREBASE_SERVICE_ACCOUNT) {
    serviceAccount = JSON.parse(process.env.FIREBASE_SERVICE_ACCOUNT);
  } else {
    const keyPath = path.join(__dirname, "serviceAccountKey.json");
    if (fs.existsSync(keyPath)) {
      serviceAccount = JSON.parse(fs.readFileSync(keyPath, "utf8"));
    }
  }
} catch (err) {
  console.warn("⚠️ Firebase credentials not found or invalid.");
}

let firestore = null;
if (serviceAccount) {
  admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
  });
  console.log("Firestore Connected!");
  firestore = admin.firestore();
}

module.exports = firestore;
