const express = require('express');
const path = require('path');
const app = express();

// Elastic Beanstalk uses process.env.PORT
const port = process.env.PORT || 8080;

// Serve static files (index.html, style.css) from the root directory
app.use(express.static(path.join(__dirname)));

app.listen(port, () => {
  console.log(`Portfolio server running on port ${port}`);
});
