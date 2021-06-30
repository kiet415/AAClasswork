function range(start, end) {
    if(start === end) return [start]
    let arr = range(start, end-1);
    arr.push(end);
    return arr;
}

console.log(range(1,10));

function sumRec(arr) {
    if( arr.length===0 ) return 0;
    let sum = arr[0];
    sum += sumRec(arr.slice(1,arr.length));
    return sum;
}

console.log(sumRec([1,2,3,4,5]));


function exponent(base, exp) {
    if (exp === 0 ) return 1;
    return base * exponent(base, exp - 1);
}

console.log(exponent(2,5));

function exponent2(base, exp){
    if(exp === 0) return 1;
    if (exp === 1) return base;
    if(exp % 2 ===0){
        return exponent2(base, exp/2)**2;
    }else{
       return base * (exponent2(base, (exp-1)/2 )**2);
    }
}
console.log(exponent2(2,5));


function fibonacci(n) {
    if(n === 0) return [0];
    if(n === 1) return [0,1];

    let result = fibonacci(n-1)
    result.push(result[result.length-2] + result[result.length-1]);
    return result;
}

console.log(fibonacci(10));

function deepDup(arr){
    if(!Array.isArray(arr)) return arr;
    for (let i=0; i<arr.length; i++){
        if(Array.isArray(arr[i])){
            return deepDup(arr[i]);
        }else{
            return arr;
        }
    }
}

console.log(deepDup([1,[2,3,4,5],3,4,5]));

function bsearch(arr, target) {
    if (arr.length === 0) return -1;
    let mid = Math.floor(arr.length / 2);
    let midValue = arr[mid];
    if(midValue === target) return mid;
    
    let left = arr.slice(0, mid);
    let right = arr.slice(mid+1, arr.length);

    if (target < midValue) {
        return bsearch(left, target);
    } else {
        let idx = bsearch(right, target);
        if (idx !== -1) {
          return idx + mid + 1;  
        } else {
            return -1;
        }
        
    }
}

console.log(bsearch([1,3,4,6,7,9,10], 7));

function mergesort(arr){
    if (arr.length <= 1) return arr;
    let mid = Math.floor(arr.length / 2);
    let left = mergesort(arr.slice(0, mid));
    let right = mergesort(arr.slice(mid, arr.length));
    let res = mergehelper(left,right);
    console.log(res);
    return res;
    //return mergehelper(left,right);
}

function mergehelper(arr1, arr2){
    let res = [];
    console.log(arr1, arr2);
    while( arr1.length !== 0 || arr2.length !== 0){
        if( arr1[0] <= arr2[0] ){
            let val = arr1.shift();
            res.push(val);
        }else{
            let val = arr2.shift();
            res.push(val);
        }
    }
    res = res.concat(arr1);
    res = res.concat(arr2);
    return res;

}

console.log(mergesort([3,4,1,6,9,7]));

