
//THIS REQUIRES THE mssql Driver --use:  npm install mssql

var express = require('express');
var app = express();

app.get('/', function (req, res) {
   
    var sql = require("mssql");

    // config for your database
    var config = {
        user: 'HackSQL2',
        password: 'M@rskH@ckSQL2016',
        server: 'maerskhackathonsql.database.windows.net ', 
        database: 'HackSQL2' 
    };

    // connect to your database
    sql.connect(config, function (err) {
    
        if (err) console.log(err);

        // create Request object
        var request = new sql.Request();
           
        // query to the database and get the records
        request.query('SELECT top 1 equipment_no FROM freighthereum.container WHERE address IS NULL AND container_status = 1;', function (err, recordset) {
            
            if (err) console.log(err)

            // send records as a response
            res.send(recordset);
            
        });
    });
});

var server = app.listen(5000, function () {
    console.log('Server is running..');
});
