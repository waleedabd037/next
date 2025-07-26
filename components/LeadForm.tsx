'use client';
import { useState } from 'react';

interface LeadFormData {
  name: string;
  email: string;
  message: string;
}

interface FormResponse {
  result: {
    success: boolean;
    error?: string;
  };
}

const LeadForm = () => {
  const [formData, setFormData] = useState<LeadFormData>({
    name: '',
    email: '',
    message: ''
  });
  const [status, setStatus] = useState<{
    message: string;
    type: 'success' | 'error' | '';
  }>({ message: '', type: '' });

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setStatus({ message: 'Submitting...', type: 'success' });

    try {
      const response = await fetch('http://localhost:8069/lead2/lead2', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          params: formData
        })
      });

      const data: FormResponse = await response.json();

      if (data.result.success) {
        setStatus({ 
          message: 'Lead created successfully!', 
          type: 'success' 
        });
        setFormData({ name: '', email: '', message: '' });
      } else {
        setStatus({ 
          message: data.result.error || 'Failed to create lead', 
          type: 'error' 
        });
      }
    } catch (error) {
      setStatus({ 
        message: 'Error submitting form', 
        type: 'error' 
      });
      console.error('Error:', error);
    }
  };

  return (
    <div className="max-w-md mx-auto mt-8 p-6 bg-white rounded-lg shadow-md">
      <h2 className="text-2xl font-bold mb-6">Create New Lead</h2>
      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label htmlFor="name" className="block text-sm font-medium mb-1">
            Name
          </label>
          <input
            type="text"
            id="name"
            name="name"
            value={formData.name}
            onChange={handleChange}
            required
            className="w-full px-3 py-2 border rounded-md"
          />
        </div>

        <div>
          <label htmlFor="email" className="block text-sm font-medium mb-1">
            Email
          </label>
          <input
            type="email"
            id="email"
            name="email"
            value={formData.email}
            onChange={handleChange}
            required
            className="w-full px-3 py-2 border rounded-md"
          />
        </div>

        <div>
          <label htmlFor="message" className="block text-sm font-medium mb-1">
            Message
          </label>
          <textarea
            id="message"
            name="message"
            value={formData.message}
            onChange={handleChange}
            required
            rows={4}
            className="w-full px-3 py-2 border rounded-md"
          />
        </div>

        <button
          type="submit"
          className="w-full bg-blue-600 text-white py-2 px-4 rounded-md hover:bg-blue-700 transition-colors"
        >
          Submit Lead
        </button>

        {status.message && (
          <div
            className={`mt-4 p-3 rounded ${
              status.type === 'success' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'
            }`}
          >
            {status.message}
          </div>
        )}
      </form>
    </div>
  );
};

export default LeadForm;