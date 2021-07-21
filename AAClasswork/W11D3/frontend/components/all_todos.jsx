import React from "react";

export const ToDoItem = (props) => {
    // const {todos} = props
    // todos.map(todo => {
    //     return (
    //         <li>
    //             title: {todo.title}
    //             <br />
    //             body: {todo.body}
    //         </li>
    //     )
    // })
    // debugger
    return (
        <div>
            <ul>
                <li> 
                    title: {props.todo.title} 
                    <br />
                    body: {props.todo.body}
                </li>
            </ul>
        </div>
    )
}