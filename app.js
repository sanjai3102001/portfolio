const express = require('express');
const app = express();

// Elastic Beanstalk provides the port on process.env.PORT
const port = process.env.PORT || 8080;

app.get('/', (req, res) => {
  const message = '<h1>Hello from your Node.js App!</h1><p>If you are seeing this, your AWS CodePipeline is working correctly.</p>';
  res.send(message);
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
