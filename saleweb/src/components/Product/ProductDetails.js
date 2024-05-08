import { useEffect, useState } from "react";
import { Col, Image, Row } from "react-bootstrap";
import { useParams } from "react-router-dom";
import APIs, { endpoints } from "../../configs/APIs";
import MySpinner from "../Commons/MySpinner";

const ProductDetails = () => {
    const [product, setProduct] = useState(null);
    const { productId } = useParams();

    const loadProduct = async () => {
        try {
            let res = await APIs.get(endpoints['details'](productId));
            setProduct(res.data)
        } catch (ex) {
            console.error(ex);
        }
    }

    useEffect(() => {
        loadProduct();
    }, [productId]);

    return (
        <>
            <h1 className="text-center text-info mt-1">CHI TIẾT SẢN PHẨM</h1>
            {product === null ? <MySpinner /> : <>
                <Row>
                    <Col md={5} xs={6}>
                        <Image src={product.image} rounded fluid />
                    </Col>
                    <Col md={7} xs={6}>
                        <h1>{product.name}</h1>
                        <h4 className="text-muted">{product.description}</h4>
                        <h4 className="text-danger">{product.price} VNĐ</h4>
                    </Col>
                </Row>
            </>
            }
        </>
    );
}

export default ProductDetails;