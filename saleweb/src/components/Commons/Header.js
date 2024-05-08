import { useEffect, useState } from "react";
import { Col, Container, Form, Nav, Navbar, NavDropdown, Row } from "react-bootstrap";
import { useNavigate } from "react-router-dom";
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

    return (
        <>
            {categories === null ? <MySpinner /> : <>
                <Navbar expand="lg" className="bg-body-tertiary">
                    <Container>
                        <Navbar.Brand href="#home">E-commerce Website</Navbar.Brand>
                        <Navbar.Toggle aria-controls="basic-navbar-nav" />
                        <Navbar.Collapse id="basic-navbar-nav">
                            <Nav className="me-auto">
                                <Nav.Link href="#home">Trang chủ</Nav.Link>
                                <Nav.Link href="#link">Link</Nav.Link>
                                <NavDropdown title="Danh mục" id="basic-nav-dropdown">
                                    {categories.map(c => <NavDropdown.Item key={c.id} href="#" onClick={e => search(e, c.id)}>{c.name}</NavDropdown.Item>)}
                                </NavDropdown>
                            </Nav>
                        </Navbar.Collapse>
                    </Container>
                    <Form inline>
                        <Row>
                            <Col xs="auto">
                                <Form.Control
                                    type="text" value={q} onChange={e => {
                                        setQ(e.target.value);
                                        nav(`/?kw=${q}`)
                                    }}
                                    placeholder="Tìm sản phẩm"
                                    className=" mr-sm-2"
                                />
                            </Col>
                            {/* <Col xs="auto">
                        <Button type="submit">Submit</Button>
                    </Col> */}
                        </Row>
                    </Form>
                </Navbar>
            </>}
        </>
    );
}

export default Header;