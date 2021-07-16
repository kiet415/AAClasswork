import React from 'react'
// import { setInterval } from 'timers';

class Clock extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      time: new Date()
    };
  }

  tick() {
    this.setState({time: new Date()});
  }

  componentDidMount() {
    this.interval = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.interval);
  }

  render() {
    let hour = this.state.time.getHours() % 12;
    let minute = this.state.time.getMinutes();
    let second = this.state.time.getSeconds();
    return (
      <div>
        <h1>Clock</h1>
        <div>
          {hour}: {minute} : {second}
        </div>
      </div>
    )
  }
}

export default Clock