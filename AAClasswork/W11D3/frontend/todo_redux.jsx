import React from "react";
import ReactDOM from "react-dom";
import rootReducer from "../frontend/reducers/root_reducer";
import configureStore from "../frontend/store/store";
import {receiveTodos, receiveTodo, removeTodo} from "../frontend/actions/todo_actions"
import {receiveSteps, receiveStep, removeStep} from "./actions/steps_actions"


document.addEventListener("DOMContentLoaded", (event) => {
    ReactDOM.render(<h1>Todos App</h1>,document.querySelector("#root"));
    const store = configureStore();
    
    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.removeTodo = removeTodo;
    window.receiveSteps = receiveSteps;
    window.receiveStep = receiveStep;
    window.removeStep = removeStep;
})