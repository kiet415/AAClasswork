function sum() {
    // let arr = arguments;
    let sum = 0;
    for(let i = 0; i < arguments.length; i ++) {
        sum += arguments[i];
    }
    return sum;

};




// console.log(sum(1,2,3,4));

Function.prototype.myBind = function(ctx) {

    let arr = Array.from(arguments).slice(1);
    //console.log(arr)
    let that = this;
    return function() {
        let arr2 = Array.from(arguments);
        //console.log(arr2);
        return that.apply(ctx, arr.concat(arr2));
    }
}

// Function.prototype.myBind = function (ctx, ...bindArgs) {
//     // let arr = Array.from(arguments);
//     return (...callArgs) => {
//         return this.apply(ctx, bindArgs.concat(callArgs));
//     } 
// } 
//markov.says.myBind(pavlov)("meow", "a tree");



class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

//markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
//markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
//markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
//markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
//const notMarkovSays = markov.says.myBind(pavlov);
//notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true


function curriedSum(numArgs) {
    const args = [];
    function _curriedSum(num) {
        args.push(num);
        if(args.length === numArgs) {
            let sum = 0;
            for(let i = 0; i < args.length; i++) {
                sum+=args[i];
                console.log(sum);
            }
            return sum;
        } else {
           return _curriedSum;
        }
    }
    return _curriedSum;
}

//curriedSum.curry(3)(4)(20)(6);
const n = curriedSum(4);
n(5)(30)(20)(1);


Function.prototype.curry = function (numArgs) {
    const args = [];
    let that = this;
    function _curry(num) {
        args.push(num);
        if(args.length < numArgs) {
            return _curry;
        } else {
            return that.apply(null, args);
        }
    }
    return _curry;
}

Function.prototype.curry2 = function (numArgs) {
    const args = [];
    let that = this;
    function _curry(num) {
        args.push(num);
        if(args.length < numArgs) {
            return _curry;
        } else {
            return that(...args);
        }
    }
    return _curry;
}



