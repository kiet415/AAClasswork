import { connect } from 'react-redux'
import { receiveTodo } from '../actions/todo_actions'
import ToDoList from './todos_list'
import { everyTodos } from '../reducers/selectors'

const mapStateToProps = (state) => {
    return ({
        todos: everyTodos(state)
    })
}

const mapDispatchToProps = (dispatch) => {
    return({
        receiveTodo: (toDo) => {
            dispatch(receiveTodo(toDo))
        }
    })
}

export default connect(mapStateToProps,mapDispatchToProps)(ToDoList)