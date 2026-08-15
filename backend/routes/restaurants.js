const express = require("express");
const db = require("../sql/db");

const router = express.Router();

// GET all restaurants
router.get("/", (req, res) => {
    const location = req.query.location;
    
    if (location) {
        // Filter by location
        db.query("SELECT * FROM Restaurants WHERE location = ?", [location], (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            res.json(results);
        });
    } else {
        // Get all restaurants
        db.query("SELECT * FROM Restaurants", (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            res.json(results);
        });
    }
});

// GET all unique locations
router.get("/locations/all", (req, res) => {
    db.query("SELECT DISTINCT location FROM Restaurants WHERE location IS NOT NULL ORDER BY location", (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
    });
});

module.exports = router;
