const express = require("express");
const db = require("../sql/db");
const firestore = require("../nosql/firestore");

const router = express.Router();

/* ================================================================
   ADD REVIEW  → POST /reviews/add
   ================================================================ */
router.post("/add", async (req, res) => {
    try {
        const { user_id, restaurant_id, rating, review_text, dish_id } = req.body;

        // Validate incoming data
        if (!user_id || !restaurant_id || !rating || !review_text) {
            return res.status(400).json({ error: "All fields are required" });
        }

        // Get restaurant location from MySQL
        db.query("SELECT location FROM Restaurants WHERE restaurant_id = ?", [restaurant_id], async (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            
            const location = results.length > 0 ? results[0].location : null;

            // Save review in MySQL
            db.query(
                "INSERT INTO Reviews (user_id, restaurant_id, rating, review_text, location, dish_id) VALUES (?, ?, ?, ?, ?, ?)",
                [user_id, restaurant_id, rating, review_text, location, dish_id || null],
                (mysqlErr, mysqlResult) => {
                    if (mysqlErr) throw mysqlErr;

                    // Also save in Firestore
                    const firebaseData = {
                        user_id,
                        restaurant_id,
                        rating,
                        review_text,
                        location,
                        created_at: new Date()
                    };

                    // Only include dish_id if it's provided
                    if (dish_id) {
                        firebaseData.dish_id = dish_id;
                    }

                    firestore.collection("Reviews").add(firebaseData).then(docRef => {
                        res.json({
                            message: "Review added successfully!",
                            review_id: mysqlResult.insertId
                        });
                    }).catch(firebaseErr => {
                        console.error("Firebase error (but MySQL saved):", firebaseErr);
                        res.json({
                            message: "Review added to database!",
                            review_id: mysqlResult.insertId
                        });
                    });
                }
            );
        });

    } catch (error) {
        console.error("Error adding review:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});


/* ================================================================
   GET ALL REVIEWS  → GET /reviews/all
   ================================================================ */
router.get("/all", async (req, res) => {
    try {
        // Try to get from MySQL first (more reliable)
        db.query("SELECT id, user_id, restaurant_id, rating, review_text, location, dish_id, created_at FROM Reviews ORDER BY created_at DESC", (err, results) => {
            if (err) {
                console.error("MySQL error:", err);
                // Fallback to Firestore
                firestore
                    .collection("Reviews")
                    .orderBy("created_at", "desc")
                    .get()
                    .then(snapshot => {
                        let reviews = [];
                        snapshot.forEach(doc => {
                            reviews.push({
                                id: doc.id,
                                ...doc.data()
                            });
                        });
                        res.json(reviews);
                    })
                    .catch(firebaseErr => {
                        console.error("Firestore error:", firebaseErr);
                        res.status(500).json({ error: "Could not fetch reviews" });
                    });
            } else {
                res.json(results);
            }
        });

    } catch (error) {
        console.error("Error fetching reviews:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

module.exports = router;
