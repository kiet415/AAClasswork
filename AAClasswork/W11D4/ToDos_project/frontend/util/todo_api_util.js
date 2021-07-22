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