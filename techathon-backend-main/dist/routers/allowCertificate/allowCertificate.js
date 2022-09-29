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
const allowCertificate_1 = __importDefault(require("../../db/models/allowCertificate/allowCertificate"));
const router = express_1.default.Router();
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield allowCertificate_1.default.find();
        res.status(201).json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/create', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield allowCertificate_1.default.create({ event_id: req.query.event_id, allow: req.query.allow });
        res.status(201).json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/findbyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    try {
        let record = yield allowCertificate_1.default.findOne({ event_id: (_a = req.query.event_id) === null || _a === void 0 ? void 0 : _a.toString() });
        res.status(201).json(record);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/updatebyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield allowCertificate_1.default.findByIdAndUpdate(req.query.event_id, { allow: true });
        res.json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/deletebyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield allowCertificate_1.default.findByIdAndDelete(req.query.user_id);
        res.json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
exports.default = router;
