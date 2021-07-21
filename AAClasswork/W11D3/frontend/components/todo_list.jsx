import React from "react";


export class ToDoList extends React.Component {
    constructor(props) {
        super(props);
    }
    allTodos = () => {
        
        return (
            
        )
    }
    render() {
        return (
            <div>
                <h1>All Todo's</h1>
                <ul>
                    {this.allTodos()}
                </ul>
            </div>
        )
    }
}