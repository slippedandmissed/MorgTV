import express from "express";

const PORT = +process.env.PORT || 8000;

let savedURL = "https://en.wikipedia.org/wiki/Flutter_(software)";

const app = express();
app.use(express.json());

app.get("/heart", (req, res) => {
  const value = req.query.value;
  console.log(`Heart: ${value}`);
  res.json({beat: value});
});

app.post("/url", (req, res) => {
  savedURL = req.body.url;
  res.send("Success");
});

app.get("/url", (req, res) => {
  res.json({url: savedURL});
})

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Listening on port ${PORT}`);
});

export default app;