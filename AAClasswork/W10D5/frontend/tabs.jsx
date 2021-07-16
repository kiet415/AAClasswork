import React from 'react';

class Tabs extends React.Component {
    constructor(props) {
      super(props);
  
      this.state = {
        title : "",
        content : "",
        index : 0
      };
    }
  
    render() {
        const allTitles = this.props.title.map((title) => {
            return(
                <h1>{title}</h1>
        
            )
        })
        const allContent = this.props.content.map((content) => {
            return(
                <article>{content}</article>
            )
        })
        return (
            <div>
                <ul>
                    {allTitles}
                    {allContent}
                </ul>
            </div>
        )
    }
}
  
  
  export default Tabs