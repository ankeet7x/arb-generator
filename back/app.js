const mongoose = require('mongoose');
const express = require('express');
const app = express();
const morgan = require('morgan');
const dataRoute = require("./api/routes/data");
const userRoute = require('./api/routes/user');
const placeRoute = require('./api/routes/place');
const bookingRoute = require('./api/routes/booking');

mongoose.connect('mongodb+srv://ankeet:'+ process.env.MONGO_ATLAS_PW +'@cluster0.aaofu.mongodb.net/myFirstDatabase?retryWrites=true&w=majority', {useUnifiedTopology: true, useNewUrlParser: true, useCreateIndex: true});
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended: false
}));

app.use('/generator', dataRoute);

app.get('/', (req, res) => {
    res.send('api is live');
});



app.use((req, res, next) => {
    const error = new Error("Not found");
    error.status(404);
    next(error);
});

app.use((err, req, res, next) => {
    res.status(err.status || 500).json({
        error: {
            message: err.message
        }
    });
});

module.exports = app;