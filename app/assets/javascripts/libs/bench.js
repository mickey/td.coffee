// Found on http://stackoverflow.com/questions/1003855/howto-benchmark-javascript-code
// Submitted by http://stackoverflow.com/users/455581/josh (Josh)
// exemple: bench(function(){return 1/2;}, 10000, [], this)
/**
 * Figure out how long it takes for a method to execute.
 * 
 * @param {func} method to test 
 * @param {int} iterations number of executions.
 * @param {Array} args to pass in. 
 * @param {T} context the context to call the method in.
 * @return {int} the time it took, in milliseconds to execute.
 */

window.bench = function (method, iterations, args, context) {

    var time = 0;
    var timer = function (action) {
        var d = +(new Date);
        if (time < 1 || action === 'start') {
            time = d;
            return 0;
        } else if (action === 'stop') {
            var t = d - time;
            time = 0;    
            return t;
        } else {
            return d - time;    
        }
    };

    var result = [];
    var i = 0;
    timer('start');
    while (i < iterations) {
        result.push(method.apply(context, args));
        i++;
    }

    var execTime = timer('stop');

    if ( typeof console === "object") {
        console.log("Mean execution time was: ", execTime / iterations);
        console.log("Sum execution time was: ", execTime);
        console.log("Result of the method call was:", result[0]);
    }

    return execTime;  
};