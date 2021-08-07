const fs = require("fs-extra");
const klawSync = require("klaw-sync");
const path = require("path");
const files = klawSync("./Formula", { nodir: false });
files.forEach((filePath) => {
	let filename = filePath.path.split(path.sep).pop();
	let formulaName = filename.split(".").slice(0, -1).join(".");
	let autoUpdateFile = `./auto-update/${formulaName}.json`;
	// console.log(autoUpdateFile);
	if (!fs.existsSync(autoUpdateFile)) {
		console.warn(`Formula ${formulaName} 没有升级检查文件`);
	}
});
