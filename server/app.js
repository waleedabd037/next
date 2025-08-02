const express = require("express");
const bcrypt = require('bcryptjs');
const fileUpload = require("express-fileupload");
const productsRouter = require("./routes/products");
const productImagesRouter = require("./routes/productImages");
const categoryRouter = require("./routes/category");
const searchRouter = require("./routes/search");
const mainImageRouter = require("./routes/mainImages");
const userRouter = require("./routes/users");
const orderRouter = require("./routes/customer_orders");
const slugRouter = require("./routes/slugs");
const orderProductRouter = require('./routes/customer_order_product');
const wishlistRouter = require('./routes/wishlist');
//const predictRouter = require('./routes/model');
const cron = require("node-cron");
const { fetchTrendingProduct } = require('./controllers/trendingController'); // Import the cron job function

//const { fetchTrendingProduct } = require('./controller/trendingController');
//const model = require('./model');
var cors = require("cors");

const app = express();
const session = require('express-session');
//require('./controller/trendingController');
//cron.schedule("*/10 * * * * *", function() {
 // console.log("running a task every 10 second");
//});

app.use(session({
    secret: 'your_secret_key',  // Use a strong secret key
    resave: false,
    saveUninitialized: true,
}));

app.use(express.json());
app.use(
  cors({
    origin: "*",
    methods: ["GET", "POST", "PUT", "DELETE"],
    allowedHeaders: ["Content-Type", "Authorization"],
  })
);
app.use(fileUpload()); 
app.use((req, res, next) => {
  console.log(`Request made to: ${req.url}`);
  next();
});
/*app.get("/", (req, res, next) => {
    console.log(req.session);
    if (req.session && req.session.user && req.session.user.role === "admin") {
        return res.status(403).send("Admins cannot access the root page.");
    }
    // If no session or user data is found, proceed to show the root page
    res.send("Welcome to the root page!");
});*/
app.use("/api/products", productsRouter);
app.use("/api/categories", categoryRouter);
app.use("/api/images", productImagesRouter);
app.use("/api/main-image", mainImageRouter);
app.use("/api/users", userRouter);
app.use("/api/search", searchRouter);
app.use("/api/orders", orderRouter);
app.use('/api/order-product', orderProductRouter);
app.use("/api/slugs", slugRouter);
app.use("/api/wishlist", wishlistRouter);
//app.use("/api/model", predictRouter);
//fetchTrendingProduct();
const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});