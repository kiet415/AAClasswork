Function.prototype.inherits = function (base) {
    function Surrogate() {};
    Surrogate.prototype = base.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
    //this.prototype = new base();
};

function MovingObject () {}
MovingObject.prototype.move = function() {
    console.log(" moves");
}
MovingObject.prototype.shape = function() {
    console.log(" shape");
}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

Asteroid.prototype.destroy = function() {
    console.log(" crashed on something.");
}
const a = new Asteroid();
a.move();
a.destroy();

const s = new Ship();
s.move();