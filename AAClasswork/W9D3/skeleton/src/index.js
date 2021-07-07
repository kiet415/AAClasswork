const View = require("./ttt-view")// require appropriate file
const Game = require("../ttt_node/game.js") // require appropriate file

document.addEventListener("DOMContentLoaded", () => {
  // Your code here
  console.log('DOM fully loaded and parsed');
  let container = document.querySelector(".ttt");
  let game = new Game();
  new View(game, container);

});
