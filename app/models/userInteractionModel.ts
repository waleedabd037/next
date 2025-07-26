import * as brain from 'brain.js';

interface InteractionData {
  userId: string;
  productId: number;
  interactionType: string;
  createdAt: string;
}

class UserInteractionModel {
  private net: brain.NeuralNetwork<[number, number, number], [number]>;
  private interactionData: InteractionData[] | null;
  public isDataFetched: boolean;

  constructor() {
    this.net = new brain.NeuralNetwork(); // Initialize the neural network with types for input and output
    this.interactionData = null;
    this.isDataFetched = false;
  }

  // Fetch user interaction data from the API
  async fetchData(userId: string): Promise<void> {
    if (this.isDataFetched) return; // Prevent repeated API calls

    try {
      const response = await fetch(`http://localhost:3000/api/fetching-interactions?userId=${userId}`);
      if (!response.ok) {
        throw new Error('Failed to fetch interaction data');
      }

      const data: InteractionData[] = await response.json();
      console.log('Fetched user interactions:', data);
      this.interactionData = data;
      this.isDataFetched = true;

      // Process the fetched data to prepare it for training
      this.processData();
    } catch (error) {
      console.error("Error fetching data:", error);
    }
  }

  // Process the data before passing it to the model
  private processData(): void {
    if (!this.interactionData || this.interactionData.length === 0) {
      console.warn('No interaction data to process.');
      return;
    }

    // Example: Processing the data for training
    const trainingData = this.interactionData.map(interaction => {
      const createdAt = new Date(interaction.createdAt);
      const hourOfDay = createdAt.getHours();
      const dayOfWeek = createdAt.getDay(); // 0-6 (Sun-Sat)

      const interactionType = interaction.interactionType === 'click' ? 1 : 0;

      // Ensure the input has exactly 3 elements
      const input: [number, number, number] = [
        hourOfDay,   // Time feature (e.g., hour of the day)
        dayOfWeek,   // Day of the week (e.g., 0 for Sunday, 6 for Saturday)
        interactionType  // Interaction type (click = 1, else = 0)
      ];

      // Ensure output is a tuple with exactly one element
      const output: [number] = [interaction.productId]; // ProductId as output label

      return {
        input,  // Ensure input matches the type [number, number, number]
        output  // Ensure output is a tuple [number]
      };
    });

    this.trainModel(trainingData);
  }

  // Build and train the model
  private async trainModel(trainingData: { input: [number, number, number]; output: [number] }[]): Promise<void> {
    if (!trainingData || trainingData.length === 0) {
      console.warn('No training data to use.');
      return;
    }

    console.log('Training the model...');
    this.net.train(trainingData, {
      iterations: 1000, // Number of training iterations
      errorThresh: 0.005, // Acceptable error threshold
      log: true, // Log progress
      logPeriod: 100, // Log every 100 iterations
      learningRate: 0.3, // Learning rate for training
    });
    console.log('Model training complete.');
  }

  // Use the trained model to make predictions
  async predict(inputData: [number, number, number]): Promise<number | null> {
    if (!this.net) {
      console.error('Model is not trained yet');
      return null;
    }

    const prediction = this.net.run(inputData); // Get the prediction from the network
    const predictedProductId = Math.round(prediction[0]); // Round to the nearest product ID
    return predictedProductId;
  }
}

export default UserInteractionModel;
