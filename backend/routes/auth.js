const express = require("express");
const db = require("../sql/db");

const router = express.Router();

// SIGNUP
router.post("/signup", (req, res) => {
    const { name, email, password } = req.body;

    if (!name || !email || !password) {
        return res.status(400).json({ error: "Name, email, and password are required" });
    }

    db.query(
        "INSERT INTO Users (name, email, password) VALUES (?, ?, ?)",
        [name, email, password],
        (err, result) => {
            if (err) return res.status(400).json({ error: err.sqlMessage || "Signup failed" });

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
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ error: "Email and password are required" });
    }

    db.query(
        "SELECT * FROM Users WHERE email = ? AND password = ?",
        [email, password],
        (err, results) => {
            if (err) return res.status(500).json({ error: "Database error" });

            if (results.length === 0)
                return res.status(401).json({ message: "Invalid email or password" });

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
