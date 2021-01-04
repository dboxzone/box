// Create an route handler that is
// capable of rendering our Home Page:
const infoRouteHandler = async () => "@goDevBox - Home Page";

// Pack the feature "Home Page" by registering the
// route handler into Fastify's service:
const featureInfo = ["$FASTIFY_GET", ["/info", infoRouteHandler], "info"];

module.exports = featureInfo;
