const express = require("express");
const db = require("../sql/db");

const router = express.Router();

// GET all unique cuisines
router.get("/cuisines/all", (req, res) => {
    db.query("SELECT DISTINCT cuisine FROM Restaurants WHERE cuisine IS NOT NULL ORDER BY cuisine", (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
    });
});

// GET all unique locations
router.get("/locations/all", (req, res) => {
    db.query("SELECT DISTINCT location FROM Restaurants WHERE location IS NOT NULL ORDER BY location", (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
    });
});

// GET all restaurants (with optional location & cuisine filters)
router.get("/", (req, res) => {
    const location = req.query.location;
    const cuisine = req.query.cuisine;
    
    let query = "SELECT * FROM Restaurants WHERE 1=1";
    let params = [];
    
    if (location) {
        query += " AND location = ?";
        params.push(location);
    }
    
    if (cuisine) {
        query += " AND cuisine = ?";
        params.push(cuisine);
    }
    
    db.query(query, params, (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        res.json(results);
    });
});

module.exports = router;
