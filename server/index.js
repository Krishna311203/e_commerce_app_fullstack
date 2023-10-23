const express = require('express')

const port = 3000;
const app = express();

const ip = '0.0.0.0';

app.listen(port, ip, () => {
  console.log(`connected at port ${port}`);
});