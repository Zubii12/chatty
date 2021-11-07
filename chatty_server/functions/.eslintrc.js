module.exports = {
  root: true,
  env: {
    es6: true,
    node: true,
  },
  ignorePatterns: [
    '/lib/**/*', // Ignore built files.
    '/.eslintrc.js',
    '/src/config.ts',
  ],
  extends: [
    'eslint:recommended',
    'plugin:import/errors',
    'plugin:import/warnings',
    'plugin:import/typescript',
    'google',
    'plugin:@typescript-eslint/recommended',
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    project: ['tsconfig.json', 'tsconfig.dev.json'],
    sourceType: 'module',
  },
  plugins: ['@typescript-eslint', 'import', 'prettier'],
  rules: {
    '@typescript-eslint/no-empty-function': 'off',
    '@typescript-eslint/ban-ts-comment': 'off',
    '@typescript-eslint/no-non-null-assertion': 'off',
    '@typescript-eslint/no-empty-interface': 'off',
    '@typescript-eslint/no-explicit-any': 'off',
    '@typescript-eslint/no-unused-vars': 'off',
    '@typescript-eslint/no-unused-vars-experimental': 'off',
    'import/export': 'off',
    'comma-dangle': 'warn',
    'constructor-super': 'error',
    eqeqeq: ['warn', 'always'],
    'import/no-deprecated': 'warn',
    'import/no-extraneous-dependencies': 'error',
    'import/no-unassigned-import': 'warn',
    'no-cond-assign': 'error',
    'no-duplicate-case': 'error',
    'no-duplicate-imports': 'off',
    'no-empty': [
      'error',
      {
        allowEmptyCatch: true,
      },
    ],
    'no-invalid-this': 'error',
    'no-new-wrappers': 'error',
    'no-param-reassign': 'error',
    'no-redeclare': 'error',
    'no-sequences': 'error',
    'no-shadow': [
      'off',
      {
        hoist: 'all',
      },
    ],
    'no-throw-literal': 'error',
    'no-unsafe-finally': 'error',
    'no-unused-labels': 'error',
    'no-var': 'warn',
    'no-void': 'error',
    'prefer-const': 'warn',
    'object-curly-spacing': 'off',
    'max-len': [
      'warn',
      {
        code: 120,
        ignoreComments: true,
        ignoreTrailingComments: true,
        ignoreUrls: true,
        ignoreTemplateLiterals: true,
        ignoreRegExpLiterals: true,
      },
    ],
    indent: 'off',
    camelcase: 'off',
  },
  settings: {
    jsdoc: {
      tagNamePreference: {
        returns: 'return',
      },
    },
  },
};
