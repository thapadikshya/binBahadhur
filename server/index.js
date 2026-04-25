//Imports contain garxa packages ko 
require("dotenv").config();
const express = require("express");
const mongoose = require("mongoose");
const jwt = require('jsonwebtoken');

//Import other files

const authRouter= require("./routes/auth");
const employeeRouter = require("./routes/employee");
const adminRouter = require("./routes/admin");

//init
const PORT=process.env.PORT || 3000;
const DB = process.env.DB;
const app=express();


//middleware
app.use(express.json());
app.use(authRouter);
app.use(employeeRouter);
app.use(adminRouter);

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