Array.prototype.uniq = function() {
    let res = [];
    for(let i = 0; i < this.length; i++) {
        if(!res.includes(this[i])) {
            res.push(this[i]);
        }
    }
    return res;
};

console.log([1,2,2,3,3,3].uniq());

Array.prototype.twoSum = function() {
    let res = [];
    for(let i = 0; i < this.length; i++) {
        for(let j = i+1; j < this.length; j++) {
            if(this[i] + this[j] == 0) {
                res.push([i,j]);
            }
        }
    }

    return res;
};

console.log([-2,-1,0,1,2].twoSum());

Array.prototype.transpose = function() {
    let res = [];
    for(let i = 0; i < this.length; i++) {
        let temp = [];
        for(let j = 0; j < this[i].length; j++) {
            temp.push(this[j][i]);
        }
        res.push(temp);
    }
    return res;
};
console.log([[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose());

