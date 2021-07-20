import React from "react";
import ReactDOM from "react-dom";
import {todosReducer} from "./actions/todo_actions"



document.addEventListener("DOMContentLoaded", (event) => {
    
    ReactDOM.render(<h1>Todos App</h1>,document.querySelector("#root"));
})