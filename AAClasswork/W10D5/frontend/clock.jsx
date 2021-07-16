import React from 'react';

// import { setInterval } from 'timers';
const days = {
  '0' : 'Sun',
  '1' : 'Mon',
  '2' : 'Tues',
  '3' : 'Wednes',
  '4' : 'Thurs',
  '5' : 'Fri',
  '6' : 'Satur'
}
const months = {
  '0' : 'Jan',
  '1' : 'Feb',
  '2' : 'Mar',
  '3' : 'Apr',
  '4' : 'May',
  '5' : 'Jun',
  '6' : 'Jul',
  '7' : 'Aug',
  '8' : 'Sep',
  '9' : 'Oct',
  '10' : 'Nov',
  '11' : 'Dec',
}

class Clock extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      time: new Date()
    };
  }

  tick = () => {
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
    let weekday = days[this.state.time.getDay().toString()];
    let month = months[this.state.time.getMonth().toString()];
    let date = this.state.time.getDate();
    let year = this.state.time.getFullYear();

    return (
      <div className = "page">
        <div className = "clock">
          <h1>Clock</h1>
          <div className = "display-time">

            <div className = "time">
              <div>Time:</div>
              <div>Date:</div>  
            </div>

            <div className = "date">
              <div> {hour}: {minute} : {second} PDT </div>
              <div>{weekday} {month}  {date} {year}</div>
            </div>
            
          </div>
          
        </div>
          <div className = "tabs">
            <Tabs />
          </div>
      </div>
    )
  }
}

export default Clock