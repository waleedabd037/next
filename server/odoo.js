var Odoo = require('odoo-xmlrpc');

// Configure the Odoo connection
var odoo = new Odoo({
    url: 'http://localhost',
    port: 8069,
    db: 'autogen',          // Replace with your database name
    username: 'admin',       // Replace with your username
    password: 'admin'        // Replace with your password
});

// Connect to Odoo
odoo.connect(function (err) {
    if (err) {
        console.error('Authentication failed:', err);
        return;
    }
    console.log('Connected to Odoo server.');

    // Define the domain filter (empty means no filter, retrieve all records)
    var domain = [[]]; // Use a list inside a list (e.g., [[]]) for domain filters.

    // Fields to fetch (e.g., 'id', 'name')
    var fields = ['id', 'name']; // Add the specific fields you want to retrieve

    // Call the search_read method to fetch records
    odoo.execute_kw('burhan', 'search_read', [domain, {fields: fields}], function (err, value) {
        if (err) {
            console.error('Error:', err);
        } else {
            console.log('Result:', value); // Display the fetched records
        }
    });
});
