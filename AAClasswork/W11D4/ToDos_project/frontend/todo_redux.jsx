import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import {receiveTodos, receiveTodo, removeTodo} from "./actions/todo_actions"
import {receiveSteps, receiveStep, removeStep} from "./actions/steps_actions"

import {Root} from "./components/root";
import {getTodos} from './util/todo_api_util'

document.addEventListener("DOMContentLoaded", (event) => {
    
    const store = configureStore();
    
    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.removeTodo = removeTodo;
    window.receiveSteps = receiveSteps;
    window.receiveStep = receiveStep;
    window.removeStep = removeStep;

    window.getTodos = getTodos

    ReactDOM.render(<Root store = {store} />,document.querySelector("#root"));
})