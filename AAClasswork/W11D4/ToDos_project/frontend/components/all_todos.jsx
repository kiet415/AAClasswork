import React from "react";
import ToDoListContainer from './todo_list_container'

export const ToDoItem = (props) => {

    const remove = () => {
        console.log(props)
        props.removeToDo(props)
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        props.removeToDo(props) 
    }

    return (
        <div>
            <ul>
                <li>
                    title: {props.todo.title} 
                    <br />
                    body: {props.todo.body}
                </li>
            <button onClick={props.removeToDo}>Delete</button>
            </ul>
        </div>
    )
}