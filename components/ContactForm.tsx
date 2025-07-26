import React, { useState, useEffect } from 'react';

// Define the type for form data
interface FormData {
  name: string;
  email: string;
  message: string;
}

const ContactForm = () => {
  const [formData, setFormData] = useState<FormData>({
    name: '',
    email: '',
    message: ''
  });

  // Define static data to send to Odoo
  const staticData: FormData = {
    name: "Test Name",
    email: "test@example.com",
    message: "This is a hardcoded test message."
  };

  // Function to send static data to Odoo
  const sendFormDataToOdoo = async (data: FormData) => {
    try {
      const response = await fetch('/api/create-lead', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
      });

      if (response.ok) {
        console.log('Lead created successfully in Odoo CRM!');
      } else {
        console.log('Failed to create lead');
      }
    } catch (error) {
      console.error('Error creating lead:', error);
    }
  };

  // Use useEffect to send static data as soon as the component is mounted
  useEffect(() => {
    console.log("Sending static data to Odoo...");
    sendFormDataToOdoo(staticData);
  }, []); // Empty dependency array ensures this runs only once on component mount

  return (
    <div>
      <h1>Contact Form</h1>
      <p>Static data has been sent to Odoo CRM on component mount.</p>
    </div>
  );
};

export default ContactForm;
