"use strict";

// A None value is represented as null
exports["null"] = null;

// PRIVATE: Custom marker to detect wrapped nulls
var IS_WRAPPED_NULL = [];
// PRIVATE: Make a wrapped null
function WrappedNull(depth) {
  return {isWrappedNull:IS_WRAPPED_NULL, depth: depth};
}
// PRIVATE: Check if this is a wrapped null
function isWrappedNull(x) {
  return (x !== null && x.isWrappedNull === IS_WRAPPED_NULL);
}

exports.nullable = function (a, r, f) {
  // Unwrapped null
  if (a == null) {
    return r;
  }

  // By default, assume that this is a deeply nested non-null value
  // Since we collapse non-null values, we can pass it directly to the function
  var inner = a;

  // If, instead this is a deeply wrapped null
  if (isWrappedNull(a)) {
    var depth = a.depth;
    // Unwrap the Null entirely if only Singly wrapped
    // Else unwrap one layer
    inner = (depth <= 0)? null : WrappedNull(depth - 1| 0);
  }

  return f(inner);
};

exports.notNull = function (x) {
  // Nulls get wrapped
  if (x === null) {
    return WrappedNull(0);
  // Wrapped nulls, get wrapped even more
  } else if (isWrappedNull(x)) {
    return WrappedNull(x.depth + 1 | 0);
  // We collapse non-null values into the value itself
  } else {
    return x;
  }
};
