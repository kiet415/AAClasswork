import { RECEIVE_TODOS } from "../actions/todo_actions";

export const todosReducer = (oldState = {}, action) => {
    Object.freeze(oldState);
    const nextState = Object.assign({}, oldState)

    switch (action.type) {
        case RECEIVE_TODOS:
            nextState[action.todos.id] = action.todos
            return nextState;
        default:
            return oldState;
    }
}