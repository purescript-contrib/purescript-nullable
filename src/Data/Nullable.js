/* eslint-disable no-eq-null, eqeqeq */

"use strict";

exports["null"] = null;

export function nullable(a, r, f) {
  return a == null ? r : f(a);
}

export function notNull(x) {
  return x;
}
