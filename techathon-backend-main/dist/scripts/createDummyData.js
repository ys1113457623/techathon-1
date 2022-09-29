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
const users_1 = __importDefault(require("../db/models/user/users"));
const config_1 = require("../db/config/config");
(() => __awaiter(void 0, void 0, void 0, function* () {
    (0, config_1.connect)();
    const users = [
        { email_id: "emma@gmail.com", password: "falskjfe", firstName: "Emma", lastName: "Bradley", college: "gautam budh univ" },
        { email_id: "elise@gmail.com", password: "falskjfe", firstName: "Elise", lastName: "Conner", college: "gautam budh univ" },
        { email_id: "jack@gmail.com", password: "falskjfe", firstName: "Jack", lastName: "Lawson", college: "gautam budh univ" },
        { email_id: "lawson@gmail.com", password: "falskjfe", firstName: "Oliver", lastName: "Moss", college: "gautam budh univ" },
        { email_id: "moss@gmail.com", password: "falskjfe", firstName: "Jamie", lastName: "Reid", college: "gautam budh univ" },
        { email_id: "reid@gmail.com", password: "falskjfe", firstName: "Aidan", lastName: "Bradley", college: "gautam budh univ" },
        { email_id: "bradley@gmail.com", password: "falskjfe", firstName: "Jordan", lastName: "Gallagher", college: "gautam budh univ" },
        { email_id: "erin@gmail.com", password: "falskjfe", firstName: "Erin", lastName: "Miles", college: "gautam budh univ" },
        { email_id: "william@gmail.com", password: "falskjfe", firstName: "William", lastName: "May", college: "gautam budh univ" },
        { email_id: "ehtan@gmail.com", password: "falskjfe", firstName: "Ethan", lastName: "Butler", college: "gautam budh univ" },
    ];
    try {
        for (const user of users) {
            yield users_1.default.create(user);
            console.log(`Created user ${user.firstName} ${user.lastName}`);
        }
        (0, config_1.disconnect)();
    }
    catch (e) {
        console.error(e);
    }
}))();
