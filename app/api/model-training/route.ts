import { NextRequest, NextResponse } from "next/server";
import UserInteractionModel from '../../models/userInteractionModel';

export async function POST(req: NextRequest) {
  try {
    // Parse the request body to get input data
    const { inputData } = await req.json(); 

    // Check if input data is provided
    if (!inputData) {
      return NextResponse.json({ error: 'No input data provided' }, { status: 400 });
    }

    // Create an instance of the UserInteractionModel
    const model = new UserInteractionModel();

    // Ensure the model is trained before making predictions
    // You can either train the model on-demand or train it beforehand and load it
    if (!model.isDataFetched) {
      // Train the model with data if not trained
      await model.fetchData('userId'); // Replace 'userId' with an actual user ID if needed
    }

    // Use the trained model to make a prediction
    const predictedProductId = await model.predict(inputData);

    // Check if a valid prediction was made
    if (predictedProductId === null) {
      return NextResponse.json({ error: 'Prediction failed' }, { status: 500 });
    }

    // Respond with the predicted product ID
    return NextResponse.json({ predictedProductId }, { status: 200 });

  } catch (error) {
    console.error('Error during prediction:', error);
    return NextResponse.json({ error: 'Error during prediction' }, { status: 500 });
  }
}
