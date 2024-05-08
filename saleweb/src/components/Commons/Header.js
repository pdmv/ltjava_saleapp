import { useEffect, useState } from "react";
import { Badge, Button, Col, Container, Form, Nav, Navbar, NavDropdown, Row } from "react-bootstrap";
import { Link, useNavigate } from "react-router-dom";
import APIs, { endpoints } from "../../configs/APIs";
import MySpinner from "./MySpinner";

const Header = () => {
    const [categories, setCategories] = useState(null);
    const [q, setQ] = useState("")
    const nav = useNavigate();

    const loadCates = async () => {
        try {
            const res = await APIs.get(endpoints['categories']);
            setCategories(res.data);
        } catch (ex) {
            console.error(ex);
        }
    }

    useEffect(() => {
        loadCates();
    }, [])


    const search = (e, cateId) => {
        e.preventDefault();
        nav(`/?cateId=${cateId}`);
    }

    const submit = (e) => {
        e.preventDefault();
        nav(`/?kw=${q}`);
    }

    return (
        categories === null ? <MySpinner /> :
            <Navbar expand="lg" className="bg-body-tertiary">
                <Container>
                    <Navbar.Brand href="">Apple Simple Store</Navbar.Brand>
                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Navbar.Collapse id="basic-navbar-nav">
                        <Nav className="me-auto">
                            <Link to="/" className="nav-link">Trang chủ</Link>
                            <NavDropdown title="Danh mục" id="basic-nav-dropdown">
                                {categories.map(c => <NavDropdown.Item key={c.id} href="#" onClick={e => search(e, c.id)}>{c.name}</NavDropdown.Item>)}
                            </NavDropdown>
                            <Link to="/cart" className="nav-link">&#128722; <Badge bg="danger">0</Badge></Link>
                        </Nav>
                    </Navbar.Collapse>
                    <Form inline onSubmit={submit}>
                        <Row>
                            <Col xs="auto">
                                <Form.Control type="text" value={q} onChange={e => setQ(e.target.value)} placeholder="Tìm sản phẩm..." className="mr-sm-2" />

                            </Col>
                            <Col xs="auto">
                                <Button type="submit">Tìm kiếm</Button>
                            </Col>
                        </Row>
                    </Form>
                </Container>
            </Navbar>
    );
}

export default Header;