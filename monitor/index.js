/**
 * MONITOR APP
 * Don't judge me, this was a POC of a few minutes just to get the system to work.
 */

const { runHookApp } = require("@forrestjs/hooks");
const serviceFastify = require("@forrestjs/service-fastify");
const serviceFastifyHealthz = require("@forrestjs/service-fastify-healthz");

// @TODO: move to a custom handler
const axios = require('axios');
const featureWakeup = ({ registerAction }) => {
  registerAction({
    hook: '$START_FEATURE',
    name: 'wakup',
    handler: () => {
      const endpoint = 'https://alpha-api.godevbox.com/api/v1/webhooks/instance/wakeup'
      const payload = { dboxDns: process.env.DBOX_DNS }

      // @TODO: keep trying if it fails
      axios.post(endpoint, payload)
    }
  })
}

runHookApp({
  trace: "compact",
  services: [serviceFastify, serviceFastifyHealthz],
  features: [featureWakeup]
});
