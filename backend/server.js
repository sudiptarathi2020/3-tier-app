require('dotenv').config();

const express = require('express');
const router = require('./routes/router');
const productRouter = require('./routes/productRoutes');
const connectDatabase = require('./db');

const port = 5000;

const app = express();
app.use(express.json());

connectDatabase();

app.use(router);
app.use(productRouter);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
