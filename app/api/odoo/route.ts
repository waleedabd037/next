import { NextResponse } from 'next/server';

export async function POST(request: Request) {
  try {
    const body = await request.json();

    // Send data to Odoo
    const odooResponse = await fetch('http://localhost:8069/lead2/lead2', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        params: {
          name: body.name,
          email: body.email,
          message: body.message,
        },
      }),
      mode: 'cors',
    });

    // Handle response from Odoo
    const data = await odooResponse.json();

    // Check if the Odoo response is valid and successful
    if (!data || !data.result || !data.result.success) {
      return NextResponse.json(
        { error: data?.result?.error || 'Failed to create lead' },
        { status: 400 }
      );
    }

    // Prepare the successful response
    const response = NextResponse.json({ success: true });

    // Add CORS headers to the response
    response.headers.set('Access-Control-Allow-Origin', 'http://localhost:3000'); // Replace with your frontend URL in production
    response.headers.set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    response.headers.set('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept');

    return response;
  } catch (error) {
    console.error('Error:', error);

    // Return an error response with CORS headers
    const response = NextResponse.json(
      { error: 'Internal server error' },
      { status: 500 }
    );

    response.headers.set('Access-Control-Allow-Origin', 'http://localhost:3000');
    response.headers.set('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    response.headers.set('Access-Control-Allow-Headers', 'Origin, Content-Type, Accept');

    return response;
  }
}