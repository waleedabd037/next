const fs = require('fs').promises;
const path = require('path');
const brain = require('brain.js'); // Import brain.js library

const modelFilePath = path.join(__dirname, 'model.json');

// Initialize the neural network
const net = new brain.NeuralNetwork();

/**
 * Save the trained neural network model to a file.
 */
async function saveModel() {
  try {
    const json = net.toJSON();
    await fs.writeFile(modelFilePath, JSON.stringify(json, null, 2));
    console.log('Model saved successfully.');
  } catch (error) {
    console.error('Error saving the model:', error);
  }
}

/**
 * Load the model from the saved file.
 */
async function loadModel() {
  try {
    const data = await fs.readFile(modelFilePath, 'utf8');
    const json = JSON.parse(data);
    net.fromJSON(json); // Load the model into the neural network
    console.log('Model loaded successfully.');
  } catch (error) {
    console.error('Error loading the model:', error);
  }
}

/**
 * Train the neural network with interaction and prediction data.
 * @param {Array} interactions - The interaction data to train on.
 * @param {Array} predictions - The predicted products to train on.
 */
async function trainModel(interactions, predictions) {
  const trainingData = interactions.map((interaction, index) => {
    // Normalize interaction and prediction data
    const input = interaction.reduce((acc, productId) => {
      acc[productId] = 1;
      return acc;
    }, {});

    const output = predictions[index].reduce((acc, productId) => {
      acc[productId] = 1;
      return acc;
    }, {});

    return { input, output };
  });

  net.train(trainingData, {
    log: true,
    logPeriod: 100, // Log every 100 iterations
    iterations: 10000, // Train for 10,000 iterations
  });

  await saveModel(); // Save the trained model
}

/**
 * Predict the next products based on trained model.
 * @param {Array} interaction - The interaction to predict from.
 * @returns {Array} The predicted next products.
 */
async function predictNextProducts(interaction) {
  // Normalize interaction data for prediction
  console.log(interaction)
  const input = interaction.reduce((acc, productId) => {
    acc[productId] = 1;
    return acc;
  }, {});

  const output = net.run(input); // Get the prediction based on the input

  // Convert the output to an array of products with scores
  const productScores = Object.entries(output).map(([product, score]) => ({
    product,
    score
  }));

  // Sort by score in descending order to get the top products
  productScores.sort((a, b) => b.score - a.score);

  // Get the top 5 products
  const topProducts = productScores.slice(0, 5).map(entry => entry.product);

  console.log('Predicted top 5 products:', topProducts);
  return topProducts;
}

module.exports = { loadModel, trainModel, predictNextProducts };