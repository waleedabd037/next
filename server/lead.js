import fetch from 'node-fetch';

async function createLead() {
    const name = "Test Name";
    const email = "test@example.com";
    const message = "This is a test message";

    const odooUrl = "http://localhost:8069/api/create-lead"; // Replace with your Odoo server URL

    try {
        const response = await fetch(odooUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                // Add any necessary authentication headers here
            },
            body: JSON.stringify({ name, email, message }) // Sending hardcoded data to Odoo API
        });

        if (response.ok) {
            console.log({ success: true });
        } else {
            console.error({ success: false, error: 'Failed to create lead in Odoo CRM' });
        }
    } catch (error) {
        console.error({ success: false, error: 'Error making the request' });
    }
}

// Call the function
createLead();
