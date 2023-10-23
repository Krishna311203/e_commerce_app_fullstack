// package imports
const express = require('express')
const  mongoose  = require('mongoose');

// project imports
const authRouter = require('./routes/auth');


// inits
const port = 3000;
const ip = '0.0.0.0';
const app = express();
const DB = "mongodb+srv://tonystark:iamironman@cluster0.hosi4vb.mongodb.net/"

mongoose.connect(DB).then(() =>{
  console.log("connected to the database");
}).catch(e =>{
  console.error("could not connect", e);
})

app.use(authRouter)

app.listen(port, ip, () => {
  console.log(`connected at port ${port}`);
});