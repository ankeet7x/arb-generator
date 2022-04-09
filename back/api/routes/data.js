const express = require("express");
const router = express.router();
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const ArbModel = require('../models/data_model');
const { userInfo } = require("os");
const saltRounds = 10;


//add data
router.post("/add", (req, res, next) => {
    ArbModel.findOne({ isUpdate: true }).exec().then((element) => {
        const creation = ArbModel(req.body);
        if (element == null) {
            creation.save().then((message) => {
                res.status(200).json({
                    message: message,
                    code: 200
                })
            }).catch((err) => {
                res.status(err.statusCode).json({
                    message: err,
                    code: err.statusCode
                })
            })
        } else {
           try{
            el = ArbModel({language_data: res.body.language_data})
            var data = element.language_data;
            await data.update(el);
            return res.status(200).json({
                message: "Data updated successfully.",
                code: 200
            })
           }catch(e){
            return res.status(e.statusCode).json({
                message: e.err,
                code: e.statusCode
            })
           }
            

        }
    }).catch((err) => {
        res.status(err.statusCode).json({
            message: err.message,
            code: err.statusCode
        })
    })
})