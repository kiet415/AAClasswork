import React from 'react';


class PokemonIndex extends React.Component{
  constructor(props){
  super(props)
  }
  
  componentDidMount(){
  this.props.requestAllPokemon()
  }
  
  render(){
    const pokemonItems = pokemon.map(poke => (
      <PokemonIndexItem key={poke.id} pokemon={poke} />
    ));
    return (
      <section className="pokedex">
        <ul>{pokemonItems}</ul>
      </section>
    )
  }
  }
  
  
  
  export default PokemonIndex;