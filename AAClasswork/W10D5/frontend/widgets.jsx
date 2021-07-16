import Clock from './clock.jsx'
import ReactDOM from 'react-dom'
import React from 'react'

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Clock name="Widgets"/>, root);
})