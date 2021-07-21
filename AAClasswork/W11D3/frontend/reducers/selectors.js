
export const allTodos = (state) => {
    const todosArray = Object.values(state.todos);
    // return todosArray.filter(todo => todo.steps === state.steps);
    return todosArray;
}