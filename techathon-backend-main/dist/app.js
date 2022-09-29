"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const errorhandler_1 = __importDefault(require("errorhandler"));
const body_parser_1 = require("body-parser");
const method_override_1 = __importDefault(require("method-override"));
const morgan_1 = __importDefault(require("morgan"));
const config_1 = require("./db/config/config");
require('dotenv').config();
(0, config_1.connect)();
const user_1 = __importDefault(require("./routers/user/user"));
const transaction_1 = __importDefault(require("./routers/transaction/transaction"));
const event_1 = __importDefault(require("./routers/event/event"));
const eventRegister_1 = __importDefault(require("./routers/eventRegister/eventRegister"));
const eventAttendance_1 = __importDefault(require("./routers/eventAttendance/eventAttendance"));
const allowCertificate_1 = __importDefault(require("./routers/allowCertificate/allowCertificate"));
const app = (0, express_1.default)();
const port = 3000 || process.env.PORT;
app.use((0, morgan_1.default)("dev"));
app.use((0, body_parser_1.json)());
app.use((0, body_parser_1.urlencoded)({ extended: false }));
app.use((0, method_override_1.default)("_method"));
app.use((0, errorhandler_1.default)());
// app.use((req, res, next) => {
// });
app.get("/", (req, res) => {
    res.status(200).json("hey");
});
app.use('/user', user_1.default);
app.use('/transaction', transaction_1.default);
app.use('/event', event_1.default);
app.use('/eventRegister', eventRegister_1.default);
app.use('/eventAttendance', eventAttendance_1.default);
app.use('/allowCertificate', allowCertificate_1.default);
// app.get("/db", async (req: Request, res: Response) => {
//   connect();
//   try {
//     let user = await User.findone('1');
//     res.status(201).json(user);
//     disconnect();
//   }
//   catch(err) {
//     console.log(err);
//   }
// });
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
});
exports.default = app;
