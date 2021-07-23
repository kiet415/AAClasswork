export const getTodos = () => {
    return $.ajax({
        method: 'GET',
        url: '/api/todos'
    })
    // .then(
    //     todos => console.log(todos), 
    //     errors => console.log(errors)
    // )
}

export const createTodo = (todo) => {
    return $.ajax({
        method: "POST",
        url: "/api/todos",
        data: {todo: todo}
    })
}