/* global exports */
"use strict";

// module Data.Nullable

exports.$$null = null;

exports.nullable = function(a, r, f) {
    return a === null || typeof a === 'undefined' ? r : f(a);
};

exports.notNull = function(x) {
    return x;
}; 
