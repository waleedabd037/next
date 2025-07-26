'use client';

import React from 'react';
import LeadForm from '@/components/LeadForm';

export default function FormPage() {
  return (
    <main className="container mx-auto py-8">
      <h1 className="text-3xl font-bold text-center mb-8">Lead Form</h1>
      <LeadForm />
    </main>
  );
}