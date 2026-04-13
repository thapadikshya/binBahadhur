//Imports contain garxa packages ko 
const express = require("express");
require("dotenv").config();
const mongoose = require("mongoose");
const jwt = require('jsonwebtoken');

//Import other files
const authRouter= require("./routes/auth");

//init
const PORT=process.env.PORT || 3000;
const DB = process.env.DB;
const app=express();


//middleware
app.use(express.json());
app.use(authRouter);

//validation
if (!DB) {
  console.log("DB connection string missing");
  process.exit(1);
}

//connections

mongoose.connect(DB).then(() =>{
    console.log('connection successful');
})
.catch((e)=>{
    console.log(e);
})


app.listen(PORT,"0.0.0.0",()=>{
    console.log(`Server is running at port ${PORT}`);
});