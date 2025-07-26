const { loadModel, trainModel, predictNextProducts } = require('./model');

/**
 * Generate random interactions for training.
 * @returns {Array} An array of interactions.
 */
function generateRandomInteractions() {
  const products = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  const interactions = [];

  for (let i = 0; i < 5; i++) {
    const interaction = [];
    for (let j = 0; j < 3; j++) {
      const productId = products[Math.floor(Math.random() * products.length)];
      interaction.push(productId);
    }
    interactions.push(interaction); // Interaction with multiple products
  }

  return interactions;
}

/**
 * Generate random predictions.
 * @returns {Array} An array of predictions.
 */
function generateRandomPredictions() {
  const products = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
  const predictions = [];

  for (let i = 0; i < 5; i++) {
    const prediction = [];
    for (let j = 0; j < 5; j++) {
      const productId = products[Math.floor(Math.random() * products.length)];
      prediction.push(productId);
    }
    predictions.push(prediction); // Predicted next products
  }

  return predictions;
}

/**
 * Train the model with generated data.
 */
async function train() {
  console.log('Starting training...');

  const interactions = generateRandomInteractions();
  const predictions = generateRandomPredictions();

  // Train the model with the generated interactions and predictions
  await trainModel(interactions, predictions);

  console.log('Training completed.');
}

/**
 * Make a prediction based on the trained model.
 */
async function predict() {
  console.log('Making predictions...');

  // Load the trained model
  await loadModel();

  const interaction = generateRandomInteractions()[0]; // Take the first interaction for prediction

  const predictedProducts = await predictNextProducts(interaction);
  console.log('Predicted products:', predictedProducts);
}

// Train the model and then make a prediction
train().then(() => predict());
