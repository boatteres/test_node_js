import express from "express";
import cors from "cors";
import bodyParser from "body-parser";
const app = express();

const PORT = process.env.PORT || 3000;

app.use(express.json());
app.use(cors());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

import productRoutes from './routes/product.route.js';
app.use("/api", productRoutes);

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}/api/`));