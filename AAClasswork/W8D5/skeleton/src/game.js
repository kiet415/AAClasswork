import Level from "level.js"
export default class FlappyBird {
  constructor(canvas){
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
  }
  function animate() {

  }

  function restart() {
    let level = new Level(this.dimensions);
    this.animate();
  }
}