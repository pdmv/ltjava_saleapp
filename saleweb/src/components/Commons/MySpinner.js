import { Spinner } from "react-bootstrap"

const MySpinner = ({animation="grow", variant="success"}) => {
    return <Spinner animation={animation} variant={variant} />
}

export default MySpinner;