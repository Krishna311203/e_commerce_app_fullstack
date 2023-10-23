const mongoose = require('mongoose')

const userSchema = mongoose.Schema({
    fullName: { 
        type: String,
        required: true,
        trim:true,
    },
    email: { 
        type: String, 
        required: true,
        trim:true,
        validate:{
        validator:(value)=>{
            const re =/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
            return value.match(re)
            },
            message:"Please Enter a valid Email Address"

        }, 
    },
    password: { 
        type: String, 
        required: true,
    },
    address:{
        type:String,
        default:"",
    },
    type:{
        type:String,
        default:"seller"
    }
    
})

const User = mongoose.model("User",userSchema);
module.exports=User;