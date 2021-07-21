
export const everyTodos = (state) => {
    const todosArray = Object.values(state.todos);
    // return todosArray.filter(todo => todo.steps === state.steps);
    return todosArray;
}