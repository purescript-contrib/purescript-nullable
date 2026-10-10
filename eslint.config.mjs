import js from "@eslint/js";
import globals from "globals";

export default [js.configs.recommended, {
  languageOptions: {
    ecmaVersion: 6,
    sourceType: "module",
    globals: globals.browser
  },
  "rules": {
    "block-scoped-var": "error",
    "consistent-return": "error",
    "eqeqeq": "error",
    "guard-for-in": "error",
    "no-bitwise": "error",
    "no-caller": "error",
    "no-extra-parens": "off",
    "no-extend-native": "error",
    "no-loop-func": "error",
    "no-new": "error",
    "no-param-reassign": "error",
    "no-return-assign": "error",
    "no-sequences": "error",
    "no-unused-expressions": "error",
    "no-use-before-define": "error",
    "no-undef": "error",
    "no-eq-null": "error",
    "radix": "error",
    "indent": ["error", 2, { "SwitchCase": 1 }],
    "quotes": ["error", "double"],
    "semi": ["error", "always"],
    "strict": ["error", "global"]
  }
}];
