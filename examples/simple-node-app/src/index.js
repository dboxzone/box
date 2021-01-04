const path = require('path');
const { runHookApp } = require("@forrestjs/hooks");
const serviceFastify = require("@forrestjs/service-fastify");
const serviceFastifyStatic = require("@forrestjs/service-fastify-static");
const serviceFastifyHealthz = require("@forrestjs/service-fastify-healthz");
const featureInfo = require('./feature-info');

// Run the app:
runHookApp({
  trace: "compact",
  settings: {
    fastify: {
      static: {
        root: path.join(__dirname, "www")
      }
    }
  },
  services: [serviceFastify, serviceFastifyStatic, serviceFastifyHealthz],
  features: [featureInfo]
});
