"use client"
import React, { useState } from "react";

const FetchUserPredictions: React.FC = () => {
  const [userId, setUserId] = useState<string>("");
  const [predictions, setPredictions] = useState<number[]>([]); // Only state for predictions
  const [error, setError] = useState<string | null>(null);

  const handleUserIdChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setUserId(event.target.value);
  };

  const handleFetchPredictions = async () => {
    if (!userId) {
      setError("Please provide a userId");
      return;
    }

    try {
      const response = await fetch("http://localhost:3001/api/model", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ userId }),
      });

      if (!response.ok) {
        throw new Error("Failed to fetch predictions");
      }

      const data = await response.json();
      setPredictions(data.predictions || []); // Only set predictions data
      setError(null);
    } catch (error: unknown) {
      if (error instanceof Error) {
        setError(error.message);
      } else {
        setError("An unknown error occurred");
      }
    }
  };

  return (
    <div>
      <h1>Fetch User Predictions</h1>
      <div>
        <label htmlFor="userId">User ID:</label>
        <input
          type="text"
          id="userId"
          value={userId}
          onChange={handleUserIdChange}
          placeholder="Enter User ID"
        />
      </div>
      <button onClick={handleFetchPredictions}>Fetch Predictions</button>

      {error && <p style={{ color: "red" }}>{error}</p>}

      {predictions.length > 0 && (
        <div>
          <h2>Predictions</h2>
          <ul>
            {predictions.map((prediction, index) => (
              <li key={index}>Prediction {index + 1}: {prediction}</li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
};

export default FetchUserPredictions;
