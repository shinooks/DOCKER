const express = require("express");
const app = express();
const port = 3000;

app.get("/", (req, res) => {
  res.send("내가 세번째로 수정한 페이지!!!");
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
