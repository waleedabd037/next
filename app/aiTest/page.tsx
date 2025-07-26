"use client"
import React, { useState } from 'react';

const PredictionComponent = () => {
  const [predictedProductId, setPredictedProductId] = useState<number | null>(null);
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string | null>(null);

  const handlePrediction = async () => {
    const sampleData = [12, 3, 1]; // Sample input (e.g., hour, day, interaction type)
    
    setLoading(true); // Set loading state to true while the request is in progress
    setError(null); // Reset any previous errors

    try {
      const response = await fetch('/api/model-training', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ inputData: sampleData }),
      });

      if (!response.ok) {
        throw new Error('Prediction API call failed');
      }

      const { predictedProductId } = await response.json();
      setPredictedProductId(predictedProductId); // Set the predicted product ID in state
    } catch (error: any) {
      setError(error.message); // Set error message in case of failure
    } finally {
      setLoading(false); // Set loading state to false once the request is completed
    }
  };

  return (
    <div>
      <h1>Product Prediction</h1>
      <button onClick={handlePrediction} disabled={loading}>
        {loading ? 'Loading...' : 'Get Prediction'}
      </button>
      
      {predictedProductId && (
        <p>Predicted Product ID: {predictedProductId}</p>
      )}

      {error && (
        <p style={{ color: 'red' }}>Error: {error}</p>
      )}
    </div>
  );
};

export default PredictionComponent;
