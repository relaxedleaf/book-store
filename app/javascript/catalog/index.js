import React from "react";
import ReactDOM from "react-dom";
import App from './routes';

document.addEventListener("DOMContentLoaded", () => {
    const catalog = document.querySelector("#catalog");
    const cart_id = JSON.parse(catalog.getAttribute("cart_id"));
    const seller = JSON.parse(catalog.getAttribute("seller"));
    const buyerName = catalog.getAttribute("buyerName");
    const buyerAddress = catalog.getAttribute("buyerAddress");
    const buyerEmail = catalog.getAttribute("buyerEmail");
    const buyer_pay_type = catalog.getAttribute("buyer_pay_type");

    ReactDOM.render(<App cart_id={cart_id} seller={seller}
                         buyerName={buyerName} buyerAddress={buyerAddress}
                         buyerEmail={buyerEmail} buyer_pay_type={buyer_pay_type}/>, catalog);
});