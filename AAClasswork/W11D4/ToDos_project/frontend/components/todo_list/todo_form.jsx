import React from "react";

export class ToDoForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            id: this.uniqueId(),
            title: "",
            body: ""
        }
        
    }
    uniqueId() {
        return new Date().getTime();
    }
    
    updateTitle = (e) => {
        this.setState({ title: e.target.value});
    }
    
    updateBody = (e) => {
    this.setState({ body: e.target.value});
    }

    handleSubmit = (e) => {
        e.preventDefault();
        this.props.receiveTodo(this.state) 
        this.setState({
            id: this.uniqueId(),
            title: "",
            body: ""
        })
    }
    render() {
        return(
            <form onSubmit={this.handleSubmit}>
                <h1>Add Todo's here</h1>
                <label>Title
                    <input type="text" name="title" value={this.state.title} onChange={this.updateTitle}>
                    
                    </input>
                </label>
                <label>Body
                    <input type="text" name="body" value={this.state.body} onChange={this.updateBody} >
                    
                    </input>
                </label>
                <input type="submit" value="Add Todo"></input>
            </form>
        )
    }
}