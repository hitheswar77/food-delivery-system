const express = require("express");
const db = require("../sql/db");

const router = express.Router();

router.get("/:id", (req, res) => {
    const restaurant_id = req.params.id;

    db.query(
        "SELECT * FROM Menu_Items WHERE restaurant_id = ?",
        [restaurant_id],
        (err, results) => {
            if (err) return res.status(500).json({ error: err.message });
            res.json(results);
        }
    );
});

module.exports = router;
