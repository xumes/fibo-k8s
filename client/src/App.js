import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import About from './About';
import Fib from './Fib';

function App() {
  return (
    <Router>
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1>Fib Calculator</h1>

          <Link to="/">Home</Link>
          <Link to="/about">About</Link>
        </header>
        <div>
          <Route exact path="/" component={Fib} />
          <Route path="/about" component={About} />
        </div>
      </div>
    </Router>
  );
}

export default App;
