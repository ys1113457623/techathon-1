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
Object.defineProperty(exports, "__esModule", { value: true });
const users_models_1 = require("./users.models");
const config_1 = require("../../config/config");
(() => __awaiter(void 0, void 0, void 0, function* () {
    (0, config_1.connect)();
    const users = [
        { firstName: "Emma", lastName: "Bradley", age: 34 },
        { firstName: "Elise", lastName: "Conner", age: 62 },
        { firstName: "Jack", lastName: "Lawson", age: 20 },
        { firstName: "Oliver", lastName: "Moss", age: 80 },
        { firstName: "Jamie", lastName: "Reid", age: 52 },
        { firstName: "Aidan", lastName: "Bradley", age: 73 },
        { firstName: "Jordan", lastName: "Gallagher", age: 27 },
        { firstName: "Erin", lastName: "Miles", age: 23 },
        { firstName: "William", lastName: "May", age: 39 },
        { firstName: "Ethan", lastName: "Butler", age: 68 },
    ];
    try {
        for (const user of users) {
            yield users_models_1.UserModel.create(user);
            console.log(`Created user ${user.firstName} ${user.lastName}`);
        }
        (0, config_1.disconnect)();
    }
    catch (e) {
        console.error(e);
    }
}))();
