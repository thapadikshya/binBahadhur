const mongoose = require('mongoose');
const employee = require('../middleware/employee');
const complainSchema = mongoose.Schema({
     email:{
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value)=>{
                const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
            },

             message: "Please enter a valid email address",
        },
    },

    description:{
        type: String,
        required: true,
        trim: true,
    },

    employee:{
     type: String,
     required:true,
      }
});

const Complain = mongoose.model("Complain", complainSchema);
module.exports = Complain;