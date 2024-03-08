/*
    SETUP
*/

var express = require('express')
var hbs = require('hbs')
var path = require('path')
var express = require('express')
var exphbs = require("express-handlebars")
const bodyParser = require('body-parser')
const e = require('express')
var app = express()
app.engine("handlebars", exphbs.engine({ defaultLayout: false }))
app.set("view engine", "handlebars")

PORT = 2427

// Database
var db = require('./database/db-connector')

let query2 = `INSERT INTO Customers(customerName, customerContact) VALUES (?, ?)`
let customerDelete = `DELETE FROM Customers WHERE customerID = ?`
let customerUpdate = `UPDATE Customers SET customerName = ?, customerContact = ? WHERE customerID = ?`
let fflsAdd = `INSERT INTO FFLs(fflName, fflContact) VALUES (?, ?)`
let fflsDelete = `DELETE FROM FFLs WHERE fflicenseID = ?`
let fflsUpdate = `UPDATE FFLs SET fflName = ?, fflContact = ? WHERE fflicenseID = ?`
/*
    ROUTES
*/
//Static
app.use(bodyParser.urlencoded({ extended: false }))

app.get('/Customers', function(req, res) {
    let query1 = 'SELECT * FROM Customers'
    db.pool.query(query1, function(error, rows, fields) {

        const formattedRows = rows.map(customer => ({
            ID: customer.customerID,
            'Customer Name': customer.customerName,
            'Customer Contact': customer.customerContact,
            Actions:''
        }))
        // Now, pass the modified 'formattedRows' data to the rendering engine
        res.render('customerview', { title: formattedRows, data: rows })



    })
})

app.get('/FFLS', function(req, res) {
    let query1 = 'SELECT * FROM FFLs'
    db.pool.query(query1, function(error, rows, fields) {

        const formattedRows = rows.map(FFL => ({
            ID: FFL.fflicenseID,
            'FFL Name': FFL.fflName,
            'FFL Contact': FFL.fflContact,
            Actions:''
        }))
        // Now, pass the modified 'formattedRows' data to the rendering engine
        res.render('fflsview', { title: formattedRows, data: rows })



    })
})

app.get('/Firearms', function(req, res) {
    let query1 = 'SELECT * FROM Firearms'
    db.pool.query(query1, function(error, rows, fields) {

        const formattedRows = rows.map(firearm => ({
            ID: firearm.firearmID,
            Price: firearm.price,
            Model: firearm.model,
            Inventory: firearm.inventoryStock,
            'Country of Origin': firearm.countryofOrigin,
            Caliber: firearm.caliber,
            'Historic Detail': firearm.historicDetail,
            Actions: ''
        }));
        // Now, pass the modified 'formattedRows' data to the rendering engine
        res.render('firearmview', { title: formattedRows, data: rows })



    })
})


    app.post('/add-customer-form', function(req, res) {
    let data = req.body

    let name = data['cname']
    let contact = data['contact']
    
    db.pool.query(query2, [name, contact], function(error, rows, fields) {
        if (error) {
            console.log(error)
            res.sendStatus(400)
        } else {
            res.redirect('/Customers')
        }
    })
})

app.post('/add-ffls-form', function(req,res){
    let data = req.body
    let name = data['fname']
    let contact = data['contact']

    db.pool.query(fflsAdd, [name, contact], function(error, rows, fields){
        if (error) {
            console.log(error)
            res.sendStatus(400)
        } else {
            res.redirect('/FFLS')
        }
    })
})

app.post('/deleteCustomer/:customerID', function(req, res)
    {
        let customerId = req.params.customerID
        console.log(req.body)
        db.pool.query(customerDelete, [customerId], function (err, results, fields){

                        // Send the results to the browser
                        if(err){
                            console.log(err)
                            res.sendStatus(500)
                        }
                        else
                        res.redirect("/Customers")

        })
    })
    app.post('/deleteFFL/:fflicenseID', function(req, res) {
        console.log(req.body);
        db.pool.query(fflsDelete, [req.params.fflicenseID], function(err, results, fields) {
            // Send the results to the browser
            if (err) {
                console.log(err);
                res.sendStatus(500);
            } else {
                res.redirect("/FFLS");
            }
        });
    });
    
    
   

app.post('/updateCustomer/:customerID', function(req, res)
    {
        let customerId = req.params.customerID

        console.log(req.body)
        let data = req.body
        let name = data['cname']
        let contact = data['contact']
        db.pool.query(customerUpdate, [name, contact, customerId], function (err, results, fields){

                        // Send the results to the browser
                        if(err){
                            console.log(err)
                            res.sendStatus(500)
                        }
                        else
                        res.redirect("/Customers")

        })
    })

app.post('/updateFFL/:fflicenseID', function(req, res)
    {
        let fflId = req.params.fflicenseID

        console.log(req.body)
        let data = req.body
        let fname = data['fname']
        let contact = data['contact']
        db.pool.query(fflsUpdate, [fname, contact, fflId], function (err, results, fields){

                        // Send the results to the browser
                        if(err){
                            console.log(err)
                            res.sendStatus(500)
                        }
                        else
                        res.redirect("/FFLS")

        })
    })

app.use('/',express.static(path.join(__dirname, 'static')))


    
/*
    LISTENER
*/
app.listen(PORT, function() {
    console.log('Express started on Port:' + PORT + ' press Ctrl-C to terminate.')
})
