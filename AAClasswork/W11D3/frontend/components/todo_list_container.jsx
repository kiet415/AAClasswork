import { connect } from 'react-redux'
import { receiveTodo, removeTodo } from '../actions/todo_actions'
import ToDoList from './todos_list'
import { everyTodos } from '../reducers/selectors'

const mapStateToProps = (state) => {
    return ({
        todos: everyTodos(state)
    })
}

const mapDispatchToProps = (dispatch) => ({   
    receiveTodo: (toDo) => {
        dispatch(receiveTodo(toDo))
    },
    removeTodo: (toDo) => {
        dispatch(removeTodo(toDo))
    }
})

export default connect(mapStateToProps,mapDispatchToProps)(ToDoList)