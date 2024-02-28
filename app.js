/*
    SETUP
*/

// Express
var express = require('express');
var app = express();
PORT = 5321;

// Database
var db = require('./database/db-connector')

/*
    ROUTES
*/

app.get('/', function(req,res)
{
    let query1 = 'SELECT * FROM Customers'
    db.pool.query(query1, function(error, rows, fields)
    {
        res.render('customers', {data:rows})

    })
}


)

/*
    LISTENER
*/
app.listen(PORT, function(){
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});