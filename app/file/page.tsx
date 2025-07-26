"use client"
import { useState, ChangeEvent } from 'react';

const UploadPDF = () => {
  const [file, setFile] = useState<File | null>(null);
  const [message, setMessage] = useState<string>('');

  const handleFileChange = (e: ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files.length > 0) {
      setFile(e.target.files[0]);
    }
  };

  const handleUpload = async () => {
    if (!file) {
      alert('Please select a file.');
      return;
    }

    const formData = new FormData();
    formData.append('file', file);

    try {
      const response = await fetch('/api/uploadhandled', {
        method: 'POST',
        body: formData,
      });

      const result = await response.json();
      if (response.ok) {
        setMessage(`File processed successfully! Extracted data: ${result.extractedData}`);
      } else {
        setMessage(`Error: ${result.error}`);
      }
    } catch (error) {
      console.error(error);
      setMessage('An unexpected error occurred.');
    }
  };

  return (
    <div>
      <h1>Upload PDF</h1>
      <input type="file" accept="application/pdf" onChange={handleFileChange} />
      <button onClick={handleUpload}>Upload and Extract</button>
      <p>{message}</p>
    </div>
  );
};

export default UploadPDF;
