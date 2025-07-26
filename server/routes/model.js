// routes/model.js

const express = require("express");
const router = express.Router();
const { fetchUserData } = require("../controllers/model");

router.post("/", fetchUserData); // Handle POST request for user data fetching

module.exports = router;
