const express  = require('express')
// const bcrypt = require('bcrypt')
// const mongoose = require('mongoose')
// const jwt = require('jsonwebtoken')
const User = require('../models/user')

const authRouter = express.Router()

authRouter.post('/api/signup', async (req, res) => {
    try {
        const { email, password, fullName } = req.body

        // Check if user already exists
        const existingUser = await User.findOne({ email })
        if (existingUser) {
            return res.status(400).json({ message: 'User already exists' })
        }

        // Hash password
        const salt = await bcrypt.genSalt()
        const hashedPassword = await bcrypt.hash(password, salt)

        // Create new user
        const newUser = new User({
            email,
            password: hashedPassword,
            fullName
        })

        // Save user to database
        await newUser.save()

        // Create and sign JWT token
        const token = jwt.sign({ userId: newUser._id }, process.env.JWT_SECRET)

        // Return token and user data
        res.status(201).json({ token, user: { id: newUser._id, email: newUser.email, fullName: newUser.fullName } })
    } catch (error) {
        console.error(error)
        res.status(500).json({ message: 'Server error' })
    }
})

authRouter.get('/user', (req, res) => {
        res.json({ message: 'hi' });
});

module.exports = authRouter


module.exports = authRouter