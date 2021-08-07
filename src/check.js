const fs = require("fs-extra");
const klawSync = require("klaw-sync");
const path = require("path");
// 解析参数
const args = process.argv.slice(2);
let filePath = args[0];
let formulaName = "";
if (filePath) {
    console.log("参数中指定了文件名,就只检查这个文件");
    checkUpdate(filePath);
}

function checkUpdate(filePath) {
    let fileName = filePath.split(path.sep).pop();
    formulaName = fileName.split(".").slice(0, -1).join(".");
    let checkUpdateInfo = require(`../auto-update/${formulaName}.json`);
    console.log(checkUpdateInfo);
    if (checkUpdateInfo.github) {
        const githubCheck = require("./checkver-modules/github");
        let targetUrl = githubCheck.check(checkUpdateInfo);
    }
}

// const files = klawSync("./Formula", { nodir: false });
// files.forEach((filePath) => {
// 	let filename = filePath.path.split(path.sep).pop();
// 	let formulaName = filename.split(".").slice(0, -1).join(".");
// 	let autoUpdateFile = `./auto-update/${formulaName}.json`;
// 	// console.log(autoUpdateFile);
// 	if (!fs.existsSync(autoUpdateFile)) {
// 		console.warn(`Formula ${formulaName} 没有升级检查文件`);
// 	}
// });
