import { NextResponse } from 'next/server';
import fs from 'fs';
import path from 'path';
import pdfParse from 'pdf-parse';

export const runtime = 'nodejs'; // Ensure the route runs in a Node.js environment

export async function POST(request: Request) {
  try {
    // Parse the form data from the request
    const formData = await request.formData();
    const file = formData.get('file') as Blob | null;

    if (!file) {
      return NextResponse.json({ error: 'No file uploaded' }, { status: 400 });
    }

    // Convert the file to a Buffer
    const buffer = Buffer.from(await file.arrayBuffer());

    // Define the directory to store uploaded files
    const uploadsDir = path.join(process.cwd(), 'uploads');
    if (!fs.existsSync(uploadsDir)) {
      fs.mkdirSync(uploadsDir); // Create the directory if it doesn't exist
    }

    // Define the path to save the uploaded file
    const filePath = path.join(uploadsDir, 'uploaded-file.pdf');

    // Write the buffer to the file system (cast buffer as Uint8Array)
    fs.writeFileSync(filePath, new Uint8Array(buffer)); // FIXED LINE

    // Read and parse the PDF file
    const pdfBuffer = fs.readFileSync(filePath);
    const data = await pdfParse(pdfBuffer);

    // Save the extracted text to a new file
    const outputPath = path.join(process.cwd(), 'extracted-data.txt');
    fs.writeFileSync(outputPath, data.text);

    // Optionally delete the uploaded PDF file after processing
    fs.unlinkSync(filePath);

    return NextResponse.json({
      message: 'PDF processed successfully!',
      extractedData: data.text,
    });
  } catch (error) {
    console.error('Error processing PDF:', error);
    return NextResponse.json(
      { error: 'Failed to process PDF' },
      { status: 500 }
    );
  }
}
