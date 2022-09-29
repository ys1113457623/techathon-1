"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const config_1 = require("../../db/config/config");
const transaction_1 = __importDefault(require("../../db/models/transaction/transaction"));
const router = express_1.default.Router();
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    (0, config_1.connect)();
    try {
        let user = yield transaction_1.default.find();
        res.status(201).json(user);
        (0, config_1.disconnect)();
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/create', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    (0, config_1.connect)();
    try {
        let user = yield transaction_1.default.create({ transaction_id: req.query.transaction_id, user_id: req.query.user_id, event_id: req.query.event_id });
        res.status(201).json(user);
        (0, config_1.disconnect)();
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/findbyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    (0, config_1.connect)();
    try {
        let record = yield transaction_1.default.findOne({ transaction_id: (_a = req.query.transaction_id) === null || _a === void 0 ? void 0 : _a.toString() });
        res.status(201).json(record);
        (0, config_1.disconnect)();
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/updatebyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _b;
    (0, config_1.connect)();
    try {
        let user = yield transaction_1.default.findByIdAndUpdate(req.query.transaction_id, { event_id: (_b = req.query.event_id) === null || _b === void 0 ? void 0 : _b.toString() });
        res.json(user);
        (0, config_1.disconnect)();
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/deletebyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    (0, config_1.connect)();
    try {
        let user = yield transaction_1.default.findByIdAndDelete(req.query.transaction_id);
        res.json(user);
        (0, config_1.disconnect)();
    }
    catch (err) {
        console.log(err);
    }
}));
exports.default = router;
