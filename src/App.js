import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        {/* <p>
          Env Value: {process.env.REACT_APP_TEST}
        </p> */}
        <p>
          Env Value 2: {process.env.NODE_ENV !== 'production' ? process.env.REACT_APP_TEST : Window?.ENV_VARS?.REACT_APP_TEST}
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
