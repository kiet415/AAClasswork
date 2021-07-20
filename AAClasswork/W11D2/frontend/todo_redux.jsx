import React from "react";
import ReactDOM from "react-dom";
import rootReducer from "../frontend/reducers/root_reducer";
import configureStore from "../frontend/store/store";
import {receiveTodos, receiveTodo} from "../frontend/actions/todo_actions"


document.addEventListener("DOMContentLoaded", (event) => {
    ReactDOM.render(<h1>Todos App</h1>,document.querySelector("#root"));
    const store = configureStore();
    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
})