const express = require('express');
const adminRouter = express.Router();
const Complain = require("../models/complain");
const User = require("../models/user"); // FIX 1: Import the User model
const adminMiddleware = require("../middleware/admin");

// get complain
adminRouter.get('/admin/get-complain', adminMiddleware, async (req, res) => {
    try {
        const complain = await Complain.find({});
        res.json(complain);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// resolve
adminRouter.post('/admin/delete-complain', adminMiddleware, async (req, res) => {
    try {
        const { id } = req.body;
        let complain = await Complain.findByIdAndDelete(id);
        res.json(complain);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

// suspend
adminRouter.post("/admin/update-user-status", adminMiddleware, async (req, res) => {
    try {
        const { email, targetStatus } = req.body;

        // Find the user by email and update their 'status' field
        const user = await User.findOneAndUpdate(
            { email: email },
            { status: targetStatus },
            { new: true } // Returns the updated document
        );

        if (!user) {
            return res.status(400).json({ msg: "User with this email not found!" });
        }

        res.json(user);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = adminRouter;