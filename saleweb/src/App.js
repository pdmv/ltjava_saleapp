import './App.css';
import Home from './components/Product/Home';
import 'bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import ProductDetails from './components/Product/ProductDetails';
import Header from './components/Commons/Header';

function App() {
  return (
    <BrowserRouter>
    <Header />
      <Routes>
        <Route path='/' element={<Home />}/>
        <Route path='/products/:productId' element={<ProductDetails />}/>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
