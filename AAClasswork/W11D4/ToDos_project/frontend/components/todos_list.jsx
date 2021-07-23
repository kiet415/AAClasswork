import React from 'react'
import {ToDoItem} from './all_todos'
import {ToDoForm} from './todo_list/todo_form'

class ToDoList extends React.Component{
    constructor(props){
        super(props)

    }

    componentDidMount(){
        this.props.fetchTodos
    }

    render(){
        const allToDos = this.props.todos.map(todo => {
            return <ToDoItem todo={todo} removeToDo={this.props.removeToDo}/>
        })

        return(
            <div>
                <ul>
                    All TODO's
                    {allToDos}
                    <ToDoForm receiveTodo={this.props.receiveTodo}/>
                </ul>
            </div>
        )
    }
}

export default ToDoList