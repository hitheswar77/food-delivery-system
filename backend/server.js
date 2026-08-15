const express = require("express");
const cors = require("cors");

// SQL + Firestore connectors
const db = require("./sql/db");
const firestore = require("./nosql/firestore");

const app = express();
app.use(express.json());
app.use(cors());

// ---------- ROUTES ----------
const restaurantsRoute = require("./routes/restaurants");
const menuRoute = require("./routes/menu");
const ordersRoute = require("./routes/orders");
const reviewsRoute = require("./routes/reviews");
const authRoute = require("./routes/auth");

// Default test route
app.get("/", (req, res) => {
    res.send("Backend running...");
});

// Assigning route prefixes
app.use("/api/restaurants", restaurantsRoute);
app.use("/api/menu", menuRoute);
app.use("/api/order", ordersRoute);          // POST /api/order
app.use("/api/reviews", reviewsRoute);       // POST /api/reviews/add , GET /api/reviews/all
app.use("/api/auth", authRoute);             // login & signup

// ---------- START SERVER ----------
app.listen(5000, () => {
    console.log("Server running on port 5000");
});

module.exports = app;
