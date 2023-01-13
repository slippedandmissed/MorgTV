"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const PORT = +process.env.PORT || 8000;
let savedURL = "https://en.wikipedia.org/wiki/Flutter_(software)";
const app = (0, express_1.default)();
app.use(express_1.default.json());
app.get("/heart", (req, res) => {
    const value = req.query.value;
    console.log(`Heart: ${value}`);
    res.json({ beat: value });
});
app.post("/url", (req, res) => {
    savedURL = req.body.url;
});
app.get("/url", (req, res) => {
    res.json({ url: savedURL });
});
app.listen(PORT, "0.0.0.0", () => {
    console.log(`Listening on port ${PORT}`);
});
//# sourceMappingURL=index.js.map