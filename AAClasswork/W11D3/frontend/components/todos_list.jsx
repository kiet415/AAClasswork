import React from 'react'
import {ToDoItem} from './all_todos'

class ToDoList extends React.Component{
    constructor(props){
        super(props)

    }

    render(){
        const allToDos = this.props.todos.map(todo => {
            return <ToDoItem todo={todo}/>
        })

        return(
            <div>
                <ul>
                    {allToDos}
                </ul>
            </div>
        )
    }
}

export default ToDoList