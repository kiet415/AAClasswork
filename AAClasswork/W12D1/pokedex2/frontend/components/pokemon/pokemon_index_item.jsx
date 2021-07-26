import React from "react";
import { Link } from "react-router-dom";
export class PokemonIndexItem extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return(
            <li>
                <Link to={`/pokemon/${this.props.pokemon.id}`}>
                    <div>{this.props.pokemon.name}</div>
                    <img src={this.props.pokemon.imageUrl}/>
                </Link>
                
            </li>
        )
    }
}
