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
const events_1 = __importDefault(require("../../db/models/event/events"));
const router = express_1.default.Router();
const uid_1 = require("uid");
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield events_1.default.find();
        res.status(201).json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/create', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield events_1.default.create({ event_id: (0, uid_1.uid)(), eventName: req.query.eventName, eventDate: req.query.eventDate, imageLink: req.query.imageLink, host: req.query.host, location: req.query.location, desc: req.query.desc, available: req.query.available, domain: req.query.domain, price: req.query.price, duration: req.query.duration });
        res.status(201).json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/findbyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    try {
        let record = yield events_1.default.findOne({ eventName: (_a = req.query.eventName) === null || _a === void 0 ? void 0 : _a.toString() });
        res.status(201).json(record);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/updatebyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _b;
    try {
        let user = yield events_1.default.findByIdAndUpdate(req.query.eventName, { eventName: (_b = req.query.eventName) === null || _b === void 0 ? void 0 : _b.toString() });
        res.json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/deletebyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield events_1.default.findByIdAndDelete(req.query.eventName);
        res.json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
exports.default = router;
