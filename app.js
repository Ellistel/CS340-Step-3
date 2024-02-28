/*
    SETUP
*/

var express = require('express');
var hbs = require('hbs');
var path = require('path');

var app = express();
app.set('view engine', 'html')

app.set('views', path.join(__dirname, 'static'));
app.engine('html', require('hbs').__express);

PORT = 2424;
// Database
var db = require('./database/db-connector');

/*
    ROUTES
*/
//Static
app.use('/',express.static(path.join(__dirname, 'static')))

app.get('/Customers', function(req, res) {
    let query1 = 'SELECT * FROM Customers';
    db.pool.query(query1, function(error, rows, fields) {
        res.render('customers', { data: rows });
    });
});

/*
    LISTENER
*/
app.listen(PORT, function() {
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.');
});
