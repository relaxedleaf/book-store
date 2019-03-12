import React from 'react'

import NoPayType            from './NoPayType';
import CreditCardPayType    from './CreditCardPayType';
import CheckPayType         from './CheckPayType';
import PurchaseOrderPayType from './PurchaseOrderPayType';

export default class PayTypeSelector extends React.Component {
  constructor(props) {
    super(props);
    this.onPayTypeSelected = this.onPayTypeSelected.bind(this);
    this.state = { selectedPayType: null };
  }

  componentDidMount = () => {
    if(this.props.pay_type){
      if(this.props.pay_type == 1){
        this.setState({ selectedPayType: "Credit card"});
      }
      if(this.props.pay_type == 0){
        this.setState({ selectedPayType: "Check"});
      }
      if(this.props.pay_type == 2){
        this.setState({ selectedPayType: "Purchase order"});
      }
    }
    else{
      this.setState({ selectedPayType: this.props.pay_type ? this.props.pay_type : "" });
    }
  };

  onPayTypeSelected(event) {
    this.setState({ selectedPayType: event.target.value });
    if (this.props.handleSelectPayType) {
      this.props.handleSelectPayType(event.target.value);
    }
  }

  render() {
    let PayTypeCustomComponent = NoPayType;
    if (this.state.selectedPayType == "Credit card") {
      PayTypeCustomComponent = CreditCardPayType;
    } else if (this.state.selectedPayType == "Check") {
      PayTypeCustomComponent = CheckPayType;
    } else if (this.state.selectedPayType == "Purchase order") {
      PayTypeCustomComponent = PurchaseOrderPayType;
    }
    return (
      <div>
        <div className="field">
          <label htmlFor="order_pay_type">Pay type</label>
          <select className="form-control form-control-lg" id="pay_type" onChange={this.onPayTypeSelected} name="order[pay_type]">
          {/* <select id="pay_type" onChange={this.onPayTypeSelected}  
            name="order[pay_type]" value={this.state.selectedPayType}> */}
            <option value="">Select a payment method</option>
            <option value="Check" selected={this.state.selectedPayType=="Check" ? true : false} >  Check</option>
            <option value="Credit card" selected={this.state.selectedPayType=="Credit card" ? true : false}>Credit card</option>
            <option value="Purchase order" selected={this.state.selectedPayType=="Purchase order" ? true : false}>Purchase order</option>
          </select>
        </div>
        <PayTypeCustomComponent />
      </div>
    );
  }
}