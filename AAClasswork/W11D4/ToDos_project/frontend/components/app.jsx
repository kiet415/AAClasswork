import React from "react"
import ToDoListContainer from "./todo_list_container"

export class App extends React.Component {
    constructor(props) {
        super(props);
    }
    render() {
        return (
            <div>
                Working App
                <ToDoListContainer/>
            </div>
        )
    }
}