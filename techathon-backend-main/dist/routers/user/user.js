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
const users_1 = __importDefault(require("../../db/models/user/users"));
const router = express_1.default.Router();
router.get('/', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield users_1.default.find();
        res.status(201).json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/signup', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield users_1.default.create({ email_id: req.params.email_id, password: req.params.password, firstName: req.params.firstName, lastName: req.params.lastName, college: req.params.college });
        res.status(201).json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/signin', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let email_id = req.params.email_id;
        let record = yield users_1.default.findOne({ email_id: email_id });
        let pwd = record === null || record === void 0 ? void 0 : record.password;
        if (pwd == req.params.password) {
            res.send(1);
        }
        else {
            res.send(0);
        }
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/findbyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    console.log(req.query);
    try {
        let user = yield users_1.default.findOne({ email_id: (_a = req.query.email_id) === null || _a === void 0 ? void 0 : _a.toString() });
        res.status(201).json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/updatebyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield users_1.default.findByIdAndUpdate(req.params.email_id, { firstName: req.params.firstName, lastName: req.params.lastName, college: req.params.college });
        res.json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
router.post('/deletebyid', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    try {
        let user = yield users_1.default.findByIdAndDelete(req.params.email_id);
        res.json(user);
    }
    catch (err) {
        console.log(err);
    }
}));
exports.default = router;
