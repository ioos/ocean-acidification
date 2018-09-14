var express = require('express');
var router = express.Router();

/* For development, load local .env file */
if (process.env.NODE_ENV !== 'production') {
  require('dotenv').load();
}

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Ocean Acidification', GOOGLE_ANALYTICS_ID: process.env.GOOGLE_ANALYTICS_ID });
});

module.exports = router;
