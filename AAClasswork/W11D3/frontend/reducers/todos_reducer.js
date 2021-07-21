import { RECEIVE_TODOS } from "../actions/todo_actions";
import { RECEIVE_TODO } from "../actions/todo_actions";
import { REMOVE_TODO } from "../actions/todo_actions";

const initialState = {
    1: {
      id: 1,
      title: "wash car",
      body: "with soap",
      done: false
    },
    2: {
      id: 2,
      title: "wash dog",
      body: "with shampoo",
      done: true
    }
  };

export const todosReducer = (oldState = initialState, action) => {
    Object.freeze(oldState);
    const nextState = Object.assign({}, oldState)
    
    switch (action.type) {
        case RECEIVE_TODOS:
            action.todos.forEach(todo  => {
                nextState[todo.id] = todo;
            } )
            // for(let i = 0; i < action.length; i++) {
            //     nextState[action[i].id] = action[i];
            // }
            //nextState[action.todos.id] = action.todos
            return nextState;
        case RECEIVE_TODO:
            const newTODO = {[action.todo.id] : action.todo}
            return Object.assign({}, oldState , newTODO);
        case REMOVE_TODO:
            delete nextState[action.todo.id]
            return nextState;
        default:
            return oldState;
    }
}