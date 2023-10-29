const express  = require('express')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const User = require('../models/user')
const { request } = require('http')
const authRouter = express.Router()


authRouter.post('/api/signup', async (req, res) => {
    try {
        const { email, password, fullName } = req.body

        // Check if user already exists
        const existingUser = await User.findOne({ email })
        if (existingUser) {
            return res.status(400).json({ message: 'User with this email already exists!  ' })
        }

        // Hash password
        
        const hashedPassword = await bcrypt.hash(password, 8)

        // Create new user
        let newUser = new User({
            email,
            password: hashedPassword,
            fullName
        })

        // Save user to database
        await newUser.save()

        // Create and sign JWT token
        // const token = jwt.sign({ userId: newUser._id }, process.env.JWT_SECRET)

        // Return token and user data
        res.status(200).json({  user: newUser })
    } catch (e) {
        console.error(e)
        res.status(500).json({ error: e.message })
    }
})

// Sign in route
authRouter.post('/api/signin', async (req, res) => {
    try {
        const { email, password } = req.body

        // Check if user exists
        const user = await User.findOne({ email })
        if (!user) {
            return res.status(400).json({ message: 'User with this email does not exist!' })
        }

        // Check if password is correct
        const isPasswordCorrect = await bcrypt.compare(password, user.password)
        if (!isPasswordCorrect) {
            return res.status(400).json({ message: 'Incorrect password!' })
        }

        // Create and sign JWT token
        const token = jwt.sign({ Id: user._id }, process.env.JWT_SECRET)

        // Return token and user data
        res.status(200).json({ token, ...user._doc })
    } catch (e) {
        console.error(e)
        res.status(500).json({ error: e.message })
    }
})

module.exports = authRouter


