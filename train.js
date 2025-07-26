const { loadModel, trainModel, predictNextProducts } = require('./model');

/**
 * Sample interaction data for training.
 * @returns {Array} An array of sample interaction objects.
 */
function generateSampleInteractions() {
  return [
    { productId: '8' },
    { productId: '9' },
    { productId: '1' },
    { productId: '2' },
    { productId: '3' }
  ];
}

/**
 * Sample predictions data.
 * @returns {Array} An array of sample prediction objects.
 */
function generateSamplePredictions() {
  return [
    { productId: '3' },
    { productId: '4' },
    { productId: '5' },
    { productId: '6' },
    { productId: '7' }
  ];
}

/**
 * Train the model with sample data.
 */
async function train() {
  console.log('Starting training...');

  const interactions = generateSampleInteractions().map(i => [parseFloat(i.productId)]);
  const predictions = generateSamplePredictions().map(p => [parseFloat(p.productId)]);

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

  const interaction = generateSampleInteractions()[0]; // Take the first interaction for prediction

  const predictedProducts = await predictNextProducts([parseFloat(interaction.productId)]);
  console.log('Predicted products:', predictedProducts);
}

// Train the model and then make a prediction
train().then(() => predict());
