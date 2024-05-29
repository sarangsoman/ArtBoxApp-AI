const express = require('express');
const bodyParser = require('body-parser');
const axios = require('axios');

const app = express();
const port = 3000;

app.use(bodyParser.json());

app.post('/generate', async (req, res) => {
  const { description } = req.body;
  try {
    const response = await axios.post('https://api.openai.com/v1/images/generations', {
      prompt: description,
      n: 1,
      size: '512x512',
    }, {
      headers: {
        'Authorization': `Bearer qAPQnlZsDyPTsAWGR5e4T3BlbkFJLXejOAuQKzWcWKF9weEj`
      }
    });

    const imageUrl = response.data.data[0].url;
    res.json({ imageUrl });
  } catch (error) {
    console.error(error);
    res.status(500).send('Error generating image');
  }
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
