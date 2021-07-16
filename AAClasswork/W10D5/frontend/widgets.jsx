import Clock from './clock.jsx';
import ReactDOM from 'react-dom';
import React from 'react';
import Tabs from './tabs.jsx';
const tabs = [
  {'title' : 'one', 'content' : 'I am the first'},
  {'title' : 'two', 'content' : 'I am the second'},
  {'title' : 'three', 'content' : 'I am the third'}
]
function Root() {
  return (
    <div>
      <Clock />
      <Tabs tabs={tabs}/>
    </div>

  )
}
document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root />, root);
})