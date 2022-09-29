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
const allowCertificate_1 = __importDefault(require("../db/models/allowCertificate/allowCertificate"));
const config_1 = require("../db/config/config");
(() => __awaiter(void 0, void 0, void 0, function* () {
    (0, config_1.connect)();
    const events = [
        { event_id: "aearwlkgj", allow: true }
    ];
    try {
        for (const event of events) {
            yield allowCertificate_1.default.create(event);
            console.log(`Created user ${event.event_id} ${event.allow}`);
        }
        (0, config_1.disconnect)();
    }
    catch (e) {
        console.error(e);
    }
}))();
