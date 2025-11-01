const express = require('express');
const path = require('path');
const app = express();

const port = process.env.PORT || 8080;

// Serve static files like CSS, JS, images from the root directory
app.use(express.static(path.join(__dirname)));

// Explicitly serve index.html for the root route '/'
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.listen(port, () => {
  console.log(`Portfolio server running on port ${port}`);
});
