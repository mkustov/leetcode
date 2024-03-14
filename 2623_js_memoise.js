/**
 * @param {Function} fn
 * @return {Function}
 */
function memoize(fn) {
  var callers = {};

  return function(...args) {
      if(callers[args]) {
        callers[args]['count'] = callers[args]['count'] + 1
        return callers[args]['result'];
      } else {
        callers[args] = { count: 1, result: fn(...args) }
        return callers[args]['result'];
      }
  }
}


/**
* let callCount = 0;
* const memoizedFn = memoize(function (a, b) {
*	 callCount += 1;
*   return a + b;
* })
* memoizedFn(2, 3) // 5
* memoizedFn(2, 3) // 5
* console.log(callCount) // 1
*/
