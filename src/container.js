/*
 * container.js
 *
 */
const { createContainer } = require('awilix');

const Application = require('./app/Application');

const container = createContainer();

// System
container.register({
  app: asClass(Application).singleton(),
});