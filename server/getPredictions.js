const { loadModel, predictNextProducts } = require('./model');

(async function getPrediction() {
  console.log('Loading model for prediction...');
  await loadModel();

  // Sample interaction list
  const sampleInteraction = [
    { id: '1', userId: 'user123', productId: '6', interactionType: 'click', createdAt: new Date().toISOString() },
    { id: '2', userId: 'user123', productId: '8', interactionType: 'click', createdAt: new Date().toISOString() },
    { id: '3', userId: 'user123', productId: '3', interactionType: 'click', createdAt: new Date().toISOString() },
    { id: '4', userId: 'user123', productId: '8', interactionType: 'click', createdAt: new Date().toISOString() },
    { id: '5', userId: 'user123', productId: '5', interactionType: 'click', createdAt: new Date().toISOString() }
  ];
console.log(sampleInteraction);
  // Extract product IDs for prediction input
  const productIds = sampleInteraction.map(interaction => interaction.productId);

  // Get the predicted next 5 products
  const predictedProducts = await predictNextProducts(productIds);
  //console.log('Predicted top 5 products:', predictedProducts);
})(); 