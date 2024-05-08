import { useEffect, useState } from "react";
import { Button, Card, Col, Row } from "react-bootstrap";
import cookie from "react-cookies";
import { useNavigate, useSearchParams } from "react-router-dom";
import APIs, { endpoints } from "../../configs/APIs";
import MySpinner from "../Commons/MySpinner";

const Home = () => {
    const [products, setProducts] = useState([]);
    const [loading, setLoading] = useState(false);
    const [q,] = useSearchParams();
    const [page, setPage] = useState(1);
    const nav = useNavigate();

    const loadProds = async () => {
        setLoading(true);
        try {
            let url = `${endpoints['products']}?page=${page}`

            let cateId = q.get('cateId')
            if (cateId)
                url = `${url}&cateId=${cateId}`

            let kw = q.get('kw')
            if (kw)
                url = `${url}&kw=${kw}`

            const res = await APIs.get(url);
            if (page === 1)
                setProducts(res.data);
            else
                setProducts(current => {
                    return [...current, ...res.data]
                })
        } catch (ex) {
            console.error(ex);
        } finally {
            setLoading()
        }
    }

    useEffect(() => {
        loadProds();
    }, [q, page])

    const loadMore = () => {
        if (!loading)
            setPage(page + 1);
    }

    const order = (id, name, price) => {

        let cart = cookie.load("cart") || null;
        if (cart === null)
            cart = {};

        if (id in cart) {
            cart[id]["quantity"]++;
        } else {
            cart[id] = {
                "id": id,
                "name": name,
                "price": price,
                "quantity": 1
            };
        }

        cookie.save('cart', cart);
        console.info(cart);
    }

    return (
        <>
            {loading && <MySpinner />}
            <Row>
                {products.map(p => <>
                    <Col md={3} xs={12} className='p-2'>
                        <Card >
                            <Card.Img variant="top" src={p.image} />
                            <Card.Body>
                                <Card.Title>{p.name}</Card.Title>
                                <Card.Text>{p.price} VNĐ</Card.Text>
                                <Button variant="primary" className="m-1" onClick={() => nav(`/products/${p.id}`)}>Xem chi tiết</Button>
                                <Button onClick={() => order(p.id, p.name, p.price)} variant="danger" className="m-1">Đặt hàng</Button>
                            </Card.Body>
                        </Card>
                    </Col>
                </>)}
            </Row>
            <div className="text-center mb-2">
                <Button variant="info" onClick={loadMore} disabled={loading}>Xem thêm</Button>
            </div>
        </>
    );
}

export default Home;