import axios from "axios";

const BASE_URL = 'http://localhost:8080/SaleApp/';

export const endpoints = {
    'categories': '/api/categories/',
    'products': '/api/products/',
    'details': (productId) => `/api/products/${productId}/`
}

export default axios.create({
    baseURL: BASE_URL
})