Array.prototype.bubbleSort = function() {
    let sort = false;
    while(!sort) {
        sort = true;
        for(let i = 0; i < this.length; i++) {
            if(this[i] > this[i+1]) {
                let temp = this[i+1];
                this[i+1] = this[i];
                this[i] = temp;
                sort = false;
            }
        }
    }
    return this;   
}


console.log([5,1,3,7,2,9].bubbleSort());


String.prototype.substrings = function() {
    let res = [];
    for (let i=0; i<this.length; i++){
        for( let j=i; j<this.length; j++){
            res.push(this.slice(i,j+1));
        }
    }
    return res;
}

console.log("racecar".substrings());