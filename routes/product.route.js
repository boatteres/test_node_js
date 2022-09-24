import { Router } from "express";
import { getProduct, createOrder, manageOrder } from "../controllers/product.controller.js";

const router = Router();

router.get("/products", getProduct);

router.put("/product", createOrder);

router.get("/manage", manageOrder);

export default router;