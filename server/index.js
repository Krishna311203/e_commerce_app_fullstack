// package imports
const express = require('express')
const  mongoose  = require('mongoose');

// project imports
const authRouter = require('./routes/auth');
require('dotenv').config();

// inits
const port = 3000;
const ip = '0.0.0.0';
const app = express();
// const url = .
const DB = process.env.MONGO_URL

mongoose.connect(DB,{
  dbName: 'plant-appdata'
}).then(() =>{
  console.log("connected to the database");
}).catch(e =>{
  console.error("could not connect", e);
})
app.use(express.json())
app.use(authRouter)

app.listen(port, ip, () => {
  console.log(`connected at port ${port}`);
});