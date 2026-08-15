const express = require("express");
const db = require("../sql/db");

const router = express.Router();

// SIGNUP
router.post("/signup", (req, res) => {
    const { name, email } = req.body;

    db.query(
        "INSERT INTO Users (name, email) VALUES (?, ?)",
        [name, email],
        (err, result) => {
            if (err) return res.status(400).json({ error: err });

            res.json({
                message: "Signup successful",
                user_id: result.insertId,
                name,
                email
            });
        }
    );
});

// LOGIN
router.post("/login", (req, res) => {
    const { email } = req.body;

    db.query(
        "SELECT * FROM Users WHERE email = ?",
        [email],
        (err, results) => {
            if (err) return res.status(500).json({ error: err });

            if (results.length === 0)
                return res.status(404).json({ message: "User not found" });

            res.json({
                message: "Login successful",
                user_id: results[0].user_id,
                name: results[0].name,
                email
            });
        }
    );
});

module.exports = router;
