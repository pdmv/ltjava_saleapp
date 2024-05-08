import { useState } from "react";
import { Alert, Button, Table } from "react-bootstrap";
import cookie from "react-cookies";

const Cart = () => {
  const [cart, setCart] = useState(cookie.load('cart') || null);

  return (
    <>
      <h1 className="text-center text-info mt-1">GIỎ HÀNG</h1>
      {cart === null ? <Alert variant="danger">Không có sản phẩm nào trong giỏ!</Alert> : <>
        <Table striped bordered hover>
          <thead>
            <tr>
              <th>Id</th>
              <th>Tên sản phẩm</th>
              <th>Đơn giá</th>
              <th>Số lượng</th>
              <th></th>
            </tr>
          </thead>
          <tbody>
            {Object.values(cart).map(c => <tr key={c.id}>
              <td>{c.id}</td>
              <td>{c.name}</td>
              <td>{c.price} VNĐ</td>
              <td>
                {c.quantity}
                {/* <Form.Control type="number" value={c.quantity} placeholder="name@example.com" /> */}
              </td>
              <td>
                <Button variant="danger">&times;</Button>
              </td>
            </tr>)}
          </tbody>
        </Table>
      </>}
    </>
  );
}

export default Cart;