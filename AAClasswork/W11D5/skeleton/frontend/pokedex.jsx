import React from "react";
import ReactDOM from "react-dom";
import {fetchAllPokemon} from "./util/api_util"
import configureStore from './store/store';
document.addEventListener("DOMContentLoaded", () => {
    const rootEl = document.getElementById('root');
    ReactDOM.render(<h1>Pokedex</h1>, rootEl);
    const store = configureStore();
  
  // More testing
    window.store = store;
    window.fetchAllPokemon = fetchAllPokemon;
})