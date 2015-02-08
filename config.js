module.exports = {
  databaseUrl: "mongodb://localhost:27017/meshblu",
  port: 3000,
  /*tls: {
    sslPort: 443,
    cert: "/certs/server.crt",
    key: "/certs/server.key"
  },*/
  redis: {
    host: "localhost",
    port: "6379",
  },
  coap: {
    port: 5683,
    host: "localhost"
  },
  mqtt: { 
    port: 1883, 
    skynetPass: "Very big random password 34lkj23orfjvi3-94ufpvuha4wuef-a09v4ji0rhgouj" 
  } 
};
