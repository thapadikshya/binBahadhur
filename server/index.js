//Imports contain garxa packages ko 
const express = require("express");
const mongoose = require("mongoose");
const jwt = require('jsonwebtoken');

//Import other files
const authRouter= require("./routes/auth");

//init
const PORT=3000;
const app=express();
const DB ="mongodb+srv://dikshya:dikshya123@cluster0.gubve2y.mongodb.net/?appName=Cluster0"
//middleware
app.use(express.json());
app.use(authRouter);

//connections
mongoose.connect(DB).then(() =>{
    console.log('connection successful');
})
.catch((e)=>{
    console.log(e);
})


app.listen(PORT,"0.0.0.0",()=>{
    console.log('connected at port ${PORT}');
});