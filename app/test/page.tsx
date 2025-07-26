//under construction//
"use client";

import React, { useState } from "react";

const HomePage = () => {
  const [userId, setUserId] = useState<string>("");

  const fetchUserInteractions = async () => {
    if (!userId.trim()) {
      console.error("User ID is required");
      return;
    }

    try {
      const response = await fetch(`/api/fetching-interactions?userId=${userId}`);
      if (!response.ok) {
        const error = await response.json();
        console.error("Error fetching interactions:", error);
        return;
      }
      const data = await response.json();
      console.log("Complete response data:", data); // Log the complete JSON response
    } catch (err) {
      console.error("Error:", err);
    }
  };

  return (
    <div style={{ padding: "20px", fontFamily: "Arial, sans-serif" }}>
      <h1>Fetch User Interactions</h1>
      <div>
        <input
          type="text"
          placeholder="Enter User ID"
          value={userId}
          onChange={(e) => setUserId(e.target.value)}
          style={{
            padding: "8px",
            fontSize: "16px",
            marginRight: "10px",
          }}
        />
        <button
          onClick={fetchUserInteractions}
          style={{
            padding: "8px 16px",
            fontSize: "16px",
            cursor: "pointer",
            backgroundColor: "#0070f3",
            color: "#fff",
            border: "none",
            borderRadius: "4px",
          }}
        >
          Fetch Interactions
        </button>
      </div>
    </div>
  );
};

export default HomePage;
