/* Обчислення суму елементів між максимальним та мінімальними значеннями масиву. */

function quickSort(array,firstIndex,lastIndex) {
    firstIndex = firstIndex || 0;
    lastIndex = lastIndex || array.length-1;
    var i = firstIndex, j = lastIndex, middle = parseInt((firstIndex+lastIndex)/2), x = array[middle], tmp;
    do {
        while(array[i]<x) i++;
        while(x<array[j]) j--;
        if(i<=j){
            tmp = array[i];
            array[i] = array[j];
            array[j] = tmp;
            i++;
            j--;
        }
    } while(i<j);
    if (firstIndex<j) quickSort(array, firstIndex, j);
    if (i<lastIndex)  quickSort(array, i, lastIndex);
    return array;
}

function calcSum(array,firstIndex,lastIndex){
    var res = 0;
    for (let i = firstIndex; i < lastIndex; i++) {
        res = res + array[i];
    }
    return res;
}

function calculate() {
    let expr = document.getElementById("expr").value
    let array = expr.split(",").map((x)=>{return parseFloat(x)})
    let sorted = quickSort(array)
    let sum = calcSum(sorted,1,sorted.length-1);
    document.getElementById("expr").value = "sorted: "+array+", sum: "+sum
}