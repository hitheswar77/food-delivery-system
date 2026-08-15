const express = require("express");
const db = require("../sql/db");
const firestore = require("../nosql/firestore");

const router = express.Router();

router.post("/", async (req, res) => {
    const { user_id, restaurant_id, item_id, total_amount } = req.body;
    // First, get the restaurant's location (so we can store it with the order)
    db.query(
        "SELECT location FROM Restaurants WHERE restaurant_id = ?",
        [restaurant_id],
        (err, rows) => {
            if (err) {
                console.error('Error fetching restaurant location:', err);
                return res.status(500).send('DB Error');
            }

            const restLocation = (rows && rows[0] && rows[0].location) ? rows[0].location : null;

            // Insert into MySQL Orders table (include location)
            db.query(
                "INSERT INTO Orders (user_id, restaurant_id, item_id, total_amount, location) VALUES (?, ?, ?, ?, ?)",
                [user_id, restaurant_id, item_id, total_amount, restLocation],
                async (err, result) => {
                    if (err) {
                        console.error('Error inserting order:', err);
                        return res.status(500).send('DB Error');
                    }

                    const order_id = result.insertId;

                    // Log in Firestore (include location)
                    await firestore.collection("Order_Activity_Log").add({
                        order_id,
                        user_id,
                        restaurant_id,
                        location: restLocation,
                        status: "Order Placed",
                        timestamp: new Date()
                    });

                    res.json({ message: "Order placed!", order_id });
                }
            );
        }
    );
});

module.exports = router;
