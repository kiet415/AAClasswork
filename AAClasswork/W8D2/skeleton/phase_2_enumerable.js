Array.prototype.myEach = function(callback) {
    for(let i = 0; i < this.length; i++) {
        callback(this[i])
    }
};

// console.log([5,4,3,10,12].myEach(function(ele) {
//     console.log(ele);
// }));

Array.prototype.myMap = function(callback) {
    let res = [];
    this.myEach(ele => res.push(callback(ele)));
    return res;
};

//console.log([1,2,3,4].myMap(num => num * num ));

Array.prototype.myReduce = function(callback, initialValue) {
    //console.log(this)
    let copy = this.slice();
    if(initialValue === undefined){
        initialValue = this[0];
        copy = copy.slice(1);
    }
    let acc = initialValue;
    
    copy.myEach(ele => {
        acc = callback(ele, acc)
    });
    return acc;
};

console.log([1, 2, 3].myReduce(function(el, acc) {
    return acc + el;
})); // => 6
  
// with initialValue
console.log([1, 2, 3].myReduce(function(el, acc) {
    return acc + el;
}, 25)); // => 31
