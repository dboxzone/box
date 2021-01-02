/**
 * SUPER UGLY AUTH APP
 * Don't judge me, this was a POC of a few minutes just to get the system to work.
 */

const { runHookApp } = require("@forrestjs/hooks");
const serviceFastify = require("@forrestjs/service-fastify");
const serviceFastifyHealthz = require("@forrestjs/service-fastify-healthz");

runHookApp({
  trace: "compact",
  services: [serviceFastify, serviceFastifyHealthz]
});
