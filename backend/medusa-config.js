const dotenv = require("dotenv");
dotenv.config();

module.exports = {
  projectConfig: {
    database_url: process.env.DATABASE_URL,
    database_type: "postgres",
    redis_url: process.env.REDIS_URL || "fake",
    store_cors: "http://localhost:8000,http://localhost:3000",
    admin_cors: "http://localhost:7000",
  },
};
