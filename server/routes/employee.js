const expresss = require('express');
const employeeRouter = expresss.Router();
const employee = require('../middleware/employee');
const Complain = require('../models/complain'); 

//adding complain
employeeRouter.post('/employee/add-complain', employee, async(req, res)=>{
    try{
    const{email, description,employee}=req.body;
    let complain = new Complain({
        email, description,employee,userId: req.user
    });
    complain= await complain.save();
    res.json(complain);
    }catch(e){
     res.status(500).json({error: e.message})
    }
}  )
module.exports=employeeRouter;