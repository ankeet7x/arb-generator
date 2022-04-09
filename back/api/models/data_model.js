const mongoose = require("mongoose");


const arbModel = mongoose.Schema({
    language_data: {
      type: Map,
      of: String
    },
    isUpdate: {
        type: Boolean
    },
    language:{
      type: String,
      required: true
    }
  });

module.exports = mongoose.model("ArbModel", arbModel)