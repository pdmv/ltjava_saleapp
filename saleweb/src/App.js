import './App.css';
import Home from './components/Product/Home';
import 'bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import ProductDetails from './components/Product/ProductDetails';
import Header from './components/Commons/Header';
import { Container } from 'react-bootstrap';
import Cart from './components/Product/Cart';

function App() {
  return (
    <BrowserRouter>
      <Header />
      <Container>
        <Routes>
          <Route path='/' element={<Home />} />
          <Route path='/products/:productId' element={<ProductDetails />} />
          <Route path="/cart" element={<Cart />} />
        </Routes>
      </Container>
    </BrowserRouter>
  );
}

export default App;
