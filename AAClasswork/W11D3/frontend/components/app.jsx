import React from "react"
import { ToDoList } from "./todo_list";


export class App extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
            <div>
                Working App
                <ToDoList/>
            </div>
        )
    }
}